import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:nahlachicken/constant.dart';
import 'package:nahlachicken/feature/orders/presentation/domain/entity/add_order_entity.dart';
import 'package:nahlachicken/feature/orders/presentation/domain/repo/add_order_repo.dart';
part 'delivery_order_state.dart';

class DeliveryOrderCubit extends Cubit<DeliveryOrderState> {
  DeliveryOrderCubit(this.addOrderRepo) : super(DeliveryOrderInitial());

  final AddOrderRepo addOrderRepo;

  Box<String> get box => Hive.box<String>(kFilterDeliveryOrderType);
  sendFilter(String filterType) async {
    await box.put("DeliveryOrder", filterType);
    emit(UpdateFilterSucess());
    applyFilter(filterType);
  }

  String getFilter() {
    return box.get("DeliveryOrder", defaultValue: "all") ?? "all";
  }

  getdeliveryOrders() {
    List<List<AddOrderEntity>> deliveryList = getDeliveryList();
    if (deliveryList.isEmpty) {
      emit(DeliveryOrderEmpty(message: "لا توجد اوردرات دليفري "));
    } else {
      emit(DeliveryOrderSucess(orders: deliveryList));
    }
  }

  num totalDeliveryOrders() {
    num totalPrice = 0;
    List<List<AddOrderEntity>> deliveryList = getDeliveryList();

    for (var item in deliveryList) {
      for (var product in item) {
        totalPrice += product.totalPrice;
      }
    }
    return totalPrice;
  }

  searchOrder(String order) {
    List<List<AddOrderEntity>> deliveryList = getDeliveryList();
    List<List<AddOrderEntity>> searchOrder = deliveryList
        .where((item) =>
            item.isNotEmpty &&
            item[0].orderId.toLowerCase().contains(order.toLowerCase().trim()))
        .toList();

    if (order.isEmpty) {
      applyFilter(getFilter());
    } else if (searchOrder.isEmpty) {
      emit(OrderSearchEmpty());
    } else {
      emit(DeliveryOrderSearchSucess(orders: searchOrder));
    }
  }

  List<List<AddOrderEntity>> getDeliveryList() {
    var orders = addOrderRepo.getOrder();
    var deliveryList = orders
        .where(
          (element) => element[0].isDelivery == true,
        )
        .toList();
    return deliveryList;
  }

  void applyFilter(String filterType) {
    List<List<AddOrderEntity>> deliveryList = getDeliveryList();

    emit(DeliveryOrderLoading());

    switch (filterType) {
      case "all":
        getdeliveryOrders();
        break;

      case "Lastest Time":
        deliveryList.sort((a, b) => b[0].dateTime.compareTo(a[0].dateTime));
        emit(DeliveryOrderSucess(orders: deliveryList));
        break;

      case "earliest Time":
        deliveryList.sort((a, b) => a[0].dateTime.compareTo(b[0].dateTime));
        emit(DeliveryOrderSucess(orders: deliveryList));
        break;

      case "ready":
        var readyOrders =
            deliveryList.where((order) => order[0].isReady == "ready").toList();
        _emitFilter(readyOrders, "لا توجد أوردرات جاهزة");
        break;

      case "unReady":
        var unReadyOrders = deliveryList
            .where((order) => order[0].isReady == "unReady")
            .toList();
        _emitFilter(unReadyOrders, "لا توجد أوردرات غير جاهزة");
        break;

      case "Paid":
        var paidOrders = deliveryList
            .where((order) =>
                order[0].isPaid == "instaPay" || order[0].isPaid == "cash")
            .toList();
        _emitFilter(paidOrders, "لا توجد أوردرات مدفوعة");
        break;

      case "unpaid":
        var unpaidOrders =
            deliveryList.where((order) => order[0].isPaid == "unpaid").toList();
        _emitFilter(unpaidOrders, "لا توجد أوردرات غير مدفوعة");
        break;

      case "delivering":
        var deliveringOrders = deliveryList
            .where((order) => order[0].deliveryDriving.isNotEmpty)
            .toList();
        _emitFilter(deliveringOrders, "لا توجد طلبات قيد التوصيل حالياً");
        break;

      default:
        var deliveredOrders = deliveryList
            .where((order) => order[0].deliveryDriving.isEmpty)
            .toList();
        _emitFilter(deliveredOrders, "جميع الطلبات تم توصيلها بنجاح");
    }
  }

  void _emitFilter(List<List<AddOrderEntity>> ordersFilter, String message) {
    if (ordersFilter.isEmpty) {
      emit(DeliveryOrderEmpty(message: message));
    } else {
      emit(DeliveryOrderSucess(orders: ordersFilter));
    }
  }
}
