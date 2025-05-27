import 'package:hive_flutter/adapters.dart';
import 'package:nahlachicken/constant.dart';
import 'package:nahlachicken/feature/delivery/data/model/assign_delivery_model.dart';
import 'package:nahlachicken/feature/delivery/data/model/delivery_model.dart';
import 'package:nahlachicken/feature/delivery/domain/entities/assignedDeliveryOrder/assigned_delivery_order_entity.dart';
import 'package:nahlachicken/feature/delivery/domain/entities/deliveryentity/delivery_entity.dart';
import 'package:nahlachicken/feature/orders/presentation/data/models/order_model.dart';
import 'package:nahlachicken/feature/orders/presentation/domain/entity/add_order_entity.dart';

abstract class DeliveryDataSource {
  Future<void> addDelivery({
    required DeliveryModel deliveryModel,
  });

  List<DeliveryEntity> getDelivery();
  Future<void> markAsDelivery(
      {required String orderId, required String deliveryDriving});

  Future<void> addOrderToDelivery(
      {required String deliveryId,
      required List<AssignDeliveryModel> newOrder});
  Future<void> deleteDelivery(
      {required String deliveryId,
      required List<AssignedDeliveyOrderEntity> orders});

  Future<void> deleteAllDelivery();

  Future<void> deleteOrderFromDelivery(
      {required String orderId,
      required String deliverId,
      required num totalOrder});

  Future<void> deleteAllOrdersFromDelivery({
    required List<AssignedDeliveyOrderEntity> orders,
    required String deliverId,
  });

  Future<void> updateDeliveryStaus(
      {required String status, required String deliveryId});
}

class DeliveryDataSourceImp extends DeliveryDataSource {
  Box<DeliveryEntity> get box => Hive.box<DeliveryEntity>(kaddDelivery);

  Box<List> get orderBox => Hive.box<List>(kaddOrder);

  @override
  Future<void> addDelivery({required DeliveryModel deliveryModel}) async {
    await box.add(deliveryModel);
  }

  @override
  List<DeliveryEntity> getDelivery() {
    return box.values.toList();
  }

  @override
  Future<void> addOrderToDelivery({
    required String deliveryId,
    required List<AssignDeliveryModel> newOrder,
  }) async {
    final deliveryIndex = box.values
        .toList()
        .indexWhere((delivery) => delivery.deliveryid == deliveryId);

    if (deliveryIndex == -1) return;

    final deliveryKey = box.keyAt(deliveryIndex);
    final oldDelivery = box.get(deliveryKey);

    if (oldDelivery != null) {
      final updatedOrders =
          List<AssignedDeliveyOrderEntity>.from(oldDelivery.orders)
            ..addAll(newOrder);

      final updatedDelivery = DeliveryModel(
        deliveryDriving: oldDelivery.deliveryid,
        deliveryid: oldDelivery.deliveryid,
        name: oldDelivery.name,
        phoneNumber: oldDelivery.phoneNumber,
        totalPrice: oldDelivery.totalPrice + _calculateOrderTotal(newOrder),
        orderNumber: oldDelivery.orderNumber + newOrder.length,
        deliveryStatus: oldDelivery.deliveryStatus,
        deliveryTime: oldDelivery.deliveryTime,
        orders: updatedOrders,
      );

      await box.put(deliveryKey, updatedDelivery);
    }
  }

  num _calculateOrderTotal(List<AssignDeliveryModel> orderList) {
    return orderList.fold(0, (prev, order) => prev + order.totalOrder);
  }

  @override
  Future<void> markAsDelivery(
      {required String orderId, required String deliveryDriving}) async {
    final currentOrder = orderBox.get(orderId)?.cast<AddOrderEntity>() ?? [];
    if (currentOrder.isEmpty) return;
    final updatedorder = currentOrder.map((item) {
      return OrderModel(
          phoneNumber: item.phoneNumber,
          isPaid: item.isPaid,
          isReady: item.isReady,
          quantity: item.quantity,
          isDelivery: item.isDelivery,
          isOnSale: item.isOnSale,
          orderId: item.orderId,
          isFreeDelivery: item.isFreeDelivery,
          category: item.category,
          type: item.type,
          productId: item.productId,
          cleaningPrice: item.cleaningPrice,
          priceWithDiscount: item.priceWithDiscount,
          priceWithoutDiscount: item.priceWithoutDiscount,
          numberOfKilo: item.numberOfKilo,
          totalPrice: item.totalPrice,
          dateTime: item.dateTime,
          deliveryDriving: deliveryDriving);
    }).toList();

    await orderBox.put(orderId, updatedorder);
  }

  @override
  Future<void> deleteDelivery({
    required String deliveryId,
    required List<AssignedDeliveyOrderEntity> orders,
  }) async {
    final deliveryIndex = box.values
        .toList()
        .indexWhere((delivery) => delivery.deliveryid == deliveryId);

    if (deliveryIndex == -1) return;

    final deliveryKey = box.keyAt(deliveryIndex);

    await Future.wait([
      for (var order in orders)
        markAsDelivery(orderId: order.orderId, deliveryDriving: ""),
    ]);

    await box.delete(deliveryKey);
  }

  @override
  deleteAllDelivery() async {
    await box.clear();
  }

  @override
  Future<void> deleteOrderFromDelivery(
      {required String orderId,
      required String deliverId,
      required num totalOrder}) async {
    await markAsDelivery(orderId: orderId, deliveryDriving: "");

    var deliveryIndex =
        box.values.toList().indexWhere((item) => item.deliveryid == deliverId);
    var deliverykey = box.keyAt(deliveryIndex);
    var oldDelivery = box.get(deliverykey);
    final updatedOrderList =
        List<AssignedDeliveyOrderEntity>.from(oldDelivery?.orders ?? [])
          ..removeWhere((order) => order.orderId == orderId);

    DeliveryModel updatedOrders = DeliveryModel(
        deliveryid: oldDelivery!.deliveryid,
        name: oldDelivery.name,
        totalPrice:
            (oldDelivery.totalPrice - totalOrder).clamp(0, double.infinity),
        orderNumber:
            (oldDelivery.orderNumber - 1).clamp(0, oldDelivery.orderNumber),
        deliveryStatus: oldDelivery.deliveryStatus,
        orders: updatedOrderList,
        deliveryDriving: oldDelivery.deliveryDriving);
    await box.put(deliverykey, updatedOrders);
  }

  @override
  Future<void> deleteAllOrdersFromDelivery({
    required List<AssignedDeliveyOrderEntity> orders,
    required String deliverId,
  }) async {
    var deliveryIndex =
        box.values.toList().indexWhere((item) => item.deliveryid == deliverId);
    var deliverykey = box.keyAt(deliveryIndex);
    var oldDelivery = box.get(deliverykey);

    await Future.wait([
      for (var order in orders)
        markAsDelivery(orderId: order.orderId, deliveryDriving: ""),
    ]);
    DeliveryModel updatedOrders = DeliveryModel(
        deliveryid: oldDelivery!.deliveryid,
        name: oldDelivery.name,
        totalPrice: 0,
        orderNumber: 0,
        deliveryStatus: oldDelivery.deliveryStatus,
        orders: [],
        deliveryDriving: oldDelivery.deliveryDriving);
    await box.put(deliverykey, updatedOrders);
  }

  @override
  Future<void> updateDeliveryStaus(
      {required String status, required String deliveryId}) async {
    var deliveryIndex =
        box.values.toList().indexWhere((item) => item.deliveryid == deliveryId);
    var deliverykey = box.keyAt(deliveryIndex);
    var oldDelivery = box.get(deliverykey);

    DeliveryModel deliveryModel = DeliveryModel(
        deliveryid: deliveryId,
        name: oldDelivery!.name,
        totalPrice: oldDelivery.totalPrice,
        orderNumber: oldDelivery.orderNumber,
        deliveryStatus: status,
        orders: oldDelivery.orders,
        deliveryDriving: oldDelivery.deliveryDriving);
    await box.put(deliverykey, deliveryModel);
  }
}
