import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:nahlachicken/constant.dart';
import 'package:nahlachicken/feature/orders/presentation/data/models/order_model.dart';
import 'package:nahlachicken/feature/orders/presentation/domain/entity/add_order_entity.dart';
import 'package:nahlachicken/feature/orders/presentation/domain/repo/add_order_repo.dart';
import 'package:uuid/uuid.dart';

part 'add_order_state.dart';

class AddOrderCubit extends Cubit<AddOrderState> {
  AddOrderCubit(this.addOrderRepo) : super(AddOrderInitial());

  final AddOrderRepo addOrderRepo;
  List<List<AddOrderEntity>> ordersList = [];

  Box get box => Hive.box<String>(kFilterOrderType);

  Future<void> addOrder({
    required String orderId,
    required bool isDelivery,
    required bool isOnsale,
    required bool isFreeDelivery,
    required String category,
    required String type,
    required num cleaningPrice,
    required num priceWithDiscount,
    required num priceWithoutDiscount,
    required num numberOfKilo,
    required num totalPrice,
    required String quantity,
    required String phoneNumber,
  }) async {
    OrderModel orderModel = OrderModel(
      deliveryDriving: "",
      phoneNumber: phoneNumber,
      isPaid: "unpaid",
      isReady: "unReady",
      quantity: quantity,
      isDelivery: isDelivery,
      isOnSale: isOnsale,
      orderId: orderId,
      isFreeDelivery: isFreeDelivery,
      category: category,
      type: type,
      productId: Uuid().v4(),
      cleaningPrice: cleaningPrice,
      priceWithDiscount: priceWithDiscount,
      priceWithoutDiscount: priceWithoutDiscount,
      numberOfKilo: numberOfKilo,
      totalPrice: totalPrice,
      dateTime: DateTime.now(),
    );
    emit(AddOrderLoading());

    await addOrderRepo.addOrder(orderId: orderId, orderModel: orderModel);
    emit(AddOrderSucess());
  }

  getOrder() async {
    emit(GetOrderLoading());
    try {
      ordersList.clear();
      var data = addOrderRepo.getOrder();
      ordersList = data;
      if (ordersList.isEmpty) {
        emit(EmptyOrders(message: "لا توجد اوردرات الان"));
      } else {
        emit(GetOrderSucess(orders: data));
      }
    } catch (e) {
      log(e.toString());
      emit(
          GetOrderFailure(errorMessage: "There is an error. Try again later!"));
    }
  }

  Future<void> sendFilterType({required String filterType}) async {
    await box.put(kFilterOrderType, filterType);
    emit(FilterTypeUpdated(filterType: filterType));
    filterOrder(filterType: filterType);
  }

  getFilterType() {
    return box.get(kFilterOrderType, defaultValue: "all");
  }

  rest() {
    emit(AddOrderInitial());
  }

  filterOrder({required String filterType}) {
    getOrder();
    var orders = addOrderRepo.getOrder();
    if (filterType == "all") {
      emit(GetOrderSucess(orders: orders));
    } else if (filterType == "Lastest Time") {
      orders.sort((a, b) => b[0].dateTime.compareTo(a[0].dateTime));
      emit(GetOrderSucess(orders: orders));
    } else if (filterType == "earliest Time") {
      orders.sort((a, b) => a[0].dateTime.compareTo(b[0].dateTime));
      emit(GetOrderSucess(orders: orders));
    } else if (filterType == "ready") {
      var filterList =
          orders.where((item) => item[0].isReady == "ready").toList();
      emit(filterList.isEmpty
          ? GetOrderFailure(errorMessage: "لا توجد طلبات جاهزة")
          : GetOrderSucess(orders: filterList));
    } else if (filterType == "unReady") {
      var filterList =
          orders.where((item) => item[0].isReady == "unReady").toList();
      emit(filterList.isEmpty
          ? GetOrderFailure(errorMessage: "لا توجد طلبات غير جاهزة")
          : GetOrderSucess(orders: filterList));
    } else if (filterType == "Paid") {
      var filterList = orders
          .where((item) =>
              item[0].isPaid == "instaPay" || item[0].isPaid == "cash")
          .toList();
      emit(filterList.isEmpty
          ? GetOrderFailure(errorMessage: "لا توجد طلبات مدفوعة")
          : GetOrderSucess(orders: filterList));
    } else if (filterType == "unpaid") {
      var filterList =
          orders.where((item) => item[0].isPaid == "unpaid").toList();
      emit(filterList.isEmpty
          ? GetOrderFailure(errorMessage: "لا توجد طلبات غير مدفوعة")
          : GetOrderSucess(orders: filterList));
    } else if (filterType == "delivery") {
      var filterList =
          orders.where((item) => item[0].isDelivery == true).toList();
      emit(filterList.isEmpty
          ? GetOrderFailure(errorMessage: "لا توجد طلبات دليفري")
          : GetOrderSucess(orders: filterList));
    } else if (filterType == "receive") {
      var filterList =
          orders.where((item) => item[0].isDelivery == false).toList();
      emit(filterList.isEmpty
          ? GetOrderFailure(errorMessage: "لا توجد طلبات استلام من المحل")
          : GetOrderSucess(orders: filterList));
    }
  }

  Future<void> deleteProduct(String orderId, String productId) async {
    await addOrderRepo.deleteProduct(orderId, productId);
    getOrder();
  }

  Future<void> deleteOrder(String orderId) async {
    await addOrderRepo.deleteOrder(orderId);
    getOrder();
  }

  deleteAllOrders() async {
    emit(DeleteAllOrderLoading());
    try {
      await addOrderRepo.deleteAllOrders();
      getOrder();
      emit(DeleteAllOrderSucess());
    } catch (e) {
      emit(DeleteAllOrderFailure(
          errorMessage: "حدث خطا اثناء حذف الطلبات حاول مره اخرى"));
    }
  }
}
