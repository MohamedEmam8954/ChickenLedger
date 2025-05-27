import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nahlachicken/feature/delivery/domain/entities/assignedDeliveryOrder/assigned_delivery_order_entity.dart';
import 'package:nahlachicken/feature/delivery/domain/entities/deliveryentity/delivery_entity.dart';
import 'package:nahlachicken/feature/delivery/domain/repo/delivery_repo.dart';

part 'show_delivery_order_state.dart';

class ShowDeliveryOrderCubit extends Cubit<ShowDeliveryOrderState> {
  ShowDeliveryOrderCubit(this.deliveryRepo) : super(ShowDeliveryOrderInitial());
  final DeliveryRepo deliveryRepo;

  num calcTotalPriceDependOnStatus(List<AssignedDeliveyOrderEntity> orders) {
    num calcTotal = 0;
    for (var item in orders) {
      if (item.orderStatus == "unpaid") {
        calcTotal += item.totalOrder;
      }
    }
    return calcTotal;
  }

  searchOrder(String deliveryId, String searchOrder) {
    emit(LoadingSearchOrder());
    DeliveryEntity delivery = getDelivery(deliveryId);

    var searchedOrder = delivery.orders.where((item) {
      return item.orderId.toLowerCase().contains(searchOrder.toLowerCase());
    }).toList();
    if (searchedOrder.isEmpty) {
      emit(EmptySearchOrder());
    } else {
      emit(SearchOrderSucess(orders: searchedOrder));
    }
  }

  Future<void> deleteAllOrdersFromDelivery({
    required List<AssignedDeliveyOrderEntity> orders,
    required String deliveryId,
  }) async {
    await deliveryRepo.deleteAllOrdersFromDelivery(
        orders: orders, deliverId: deliveryId);
    getdelivery(deliveryId);
  }

  getdelivery(String deliveryId) {
    DeliveryEntity delivery = getDelivery(deliveryId);

    if (delivery.orders.isEmpty) {
      emit(EmptyDeliveryOrder());
    } else {
      emit(UpdateDeliveryOrderSucess(deliveryEntity: delivery));
    }
  }

  DeliveryEntity getDelivery(String deliveryId) {
    var delivery = deliveryRepo.getDelivery().firstWhere(
          (element) => element.deliveryid == deliveryId,
        );
    return delivery;
  }

  Future<void> deleteOrderFromDelivery({
    required String orderId,
    required String deliverId,
    required num totalOrder,
  }) async {
    try {
      emit(DeleteDeliveryOrderLoading());
      await deliveryRepo.deleteOrderFromDelivery(
          orderId: orderId, deliverId: deliverId, totalOrder: totalOrder);
      var delivery = deliveryRepo.getDelivery().firstWhere(
            (element) => element.deliveryid == deliverId,
          );
      if (delivery.orders.isEmpty) {
        emit(EmptyDeliveryOrder());
      } else {
        emit(UpdateDeliveryOrderSucess(deliveryEntity: delivery));
      }
    } catch (e) {
      emit(DeleteDeliveryOrderFailure(
          errorMessage: "حدث خطاء اثناء حذف المندوب"));
    }
  }
}
