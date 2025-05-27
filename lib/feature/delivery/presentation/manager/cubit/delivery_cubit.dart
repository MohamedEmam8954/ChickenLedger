import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:nahlachicken/constant.dart';
import 'package:nahlachicken/feature/delivery/data/model/assign_delivery_model.dart';
import 'package:nahlachicken/feature/delivery/data/model/delivery_model.dart';
import 'package:nahlachicken/feature/delivery/domain/entities/assignedDeliveryOrder/assigned_delivery_order_entity.dart';
import 'package:nahlachicken/feature/delivery/domain/entities/deliveryentity/delivery_entity.dart';
import 'package:nahlachicken/feature/delivery/domain/repo/delivery_repo.dart';
import 'package:uuid/uuid.dart';

part 'delivery_state.dart';

class DeliveryCubit extends Cubit<DeliveryState> {
  DeliveryCubit(this.deliveryRepo) : super(DeliveryInitial());

  final DeliveryRepo deliveryRepo;
  final List<AssignDeliveryModel> selectedOrders = [];

  Box<String> get deliveryFilterBox => Hive.box<String>(kFilterDeliveryType);

  void addDelivery({
    required String name,
    String? phoneNumber,
  }) async {
    try {
      emit(AddDeliveryLoading());
      DeliveryModel deliveryModel = DeliveryModel(
        deliveryDriving: "",
        orders: [],
        deliveryid: Uuid().v4(),
        name: name,
        totalPrice: 0,
        orderNumber: 0,
        deliveryStatus: 'unPaid',
        phoneNumber: phoneNumber,
      );

      await deliveryRepo.addDelivery(deliveryModel: deliveryModel);
      emit(AddDeliverySucess());
    } catch (e) {
      emit(AddDeliveryFailure(
        errorMessage: "حدث خطأ أثناء إضافة المندوب، يُرجى المحاولة مرة أخرى.",
      ));
    }
  }

  sendFilter(String filterType) async {
    await deliveryFilterBox.put("filterDeliveryType", filterType);
    emit(UpdateFilterSucess());
    getDelivery(filterType);
  }

  String getFilter() {
    return deliveryFilterBox.get("filterDeliveryType",
            defaultValue: 'unPaid') ??
        'unPaid';
  }

  void toggleOrderSelection({
    required AssignDeliveryModel assignDeliveryModel,
    required bool isSelected,
  }) {
    if (isSelected) {
      selectedOrders.add(assignDeliveryModel);
    } else {
      selectedOrders
          .removeWhere((order) => order.orderId == assignDeliveryModel.orderId);
    }

    emit(ToggleOrderSelctionSucess());
  }

  Future<void> markAsDelivery(
      {required String orderId, required String deliveryDriving}) async {
    await deliveryRepo.markAsDelivery(
        orderId: orderId, deliveryDriving: deliveryDriving);
  }

  unConfimedSelectOrder() {
    selectedOrders.clear();
    getDelivery(getFilter());
  }

  void confirmSelectedOrders(String deliveryId, String deliveryName) async {
    if (selectedOrders.isNotEmpty) {
      await Future.wait([
        for (var item in selectedOrders)
          markAsDelivery(orderId: item.orderId, deliveryDriving: deliveryName),
      ]);
      await deliveryRepo.addOrderToDelivery(
        deliveryId: deliveryId,
        newOrder: selectedOrders,
      );
      selectedOrders.clear();
      emit(AddOrderToDeliverySuccess());
      getDelivery(getFilter());
    }
  }

  Future<void> updateDeliveryStaus(
      {required String status, required String deliveryId}) async {
    await deliveryRepo.updateDeliveryStaus(
        status: status, deliveryId: deliveryId);
    getDelivery(getFilter());
  }

  void getDelivery(String filterType) async {
    try {
      emit(GetDeliveryLoading());
      List<DeliveryEntity> deliveryList = getDeliveryList();
      if (deliveryList.isEmpty) {
        emit(GetDeliveryEmpty(message: "لا يوجد مندوبين"));
        return;
      }
      var filterList = deliveryList
          .where((item) => item.deliveryStatus == filterType)
          .toList();

      if (filterList.isEmpty && filterType == 'unPaid') {
        emit(GetDeliveryEmpty(message: "جميع المناديب تمت محاسبتهم"));
        return;
      }

      if (filterList.isEmpty && filterType == "cash") {
        emit(GetDeliveryEmpty(message: "لم يقم أي مندوب بتسديد المبلغ"));
        return;
      }

      emit(GetDeliverySucess(deliveryList: filterList));
    } catch (e) {
      emit(GetDeliveryFailure(
        errorMessage:
            "حدث خطأ أثناء استرجاع المندوبين، يُرجى المحاولة مرة أخرى.",
      ));
    }
  }

  List<DeliveryEntity> getDeliveryList() {
    List<DeliveryEntity> deliveryList = deliveryRepo.getDelivery();
    return deliveryList;
  }

  void deliverSearch(String searchDelivery) {
    emit(DeliverySearchLoading());
    List<DeliveryEntity> deliveryList = getDeliveryList();

    List<DeliveryEntity> deliveryFilter = deliveryList
        .where((delivery) =>
            delivery.name.contains(searchDelivery) ||
            (delivery.phoneNumber != null &&
                delivery.phoneNumber!.contains(searchDelivery)))
        .toList();
    if (deliveryFilter.isEmpty) {
      emit(DeliverySearchEmpty(
          errorMessage: "لا يوجد دليفري بهذا الاسم او بهذا الرقم"));
    } else {
      emit(DeliverySearchSucess(deliveryFilter: deliveryFilter));
    }
  }

  Future<void> deleteDelivery(
      {required String deliveryId,
      required List<AssignedDeliveyOrderEntity> orders}) async {
    await deliveryRepo.deleteDelivery(deliveryId: deliveryId, orders: orders);
    getDelivery(getFilter());
  }

  Future<void> deleteAllDelivery() async {
    await deliveryRepo.deleteAllDelivery();
    getDelivery(getFilter());
  }
}
