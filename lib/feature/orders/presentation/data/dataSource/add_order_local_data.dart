import 'package:hive_flutter/adapters.dart';
import 'package:nahlachicken/constant.dart';
import 'package:nahlachicken/feature/orders/presentation/data/models/order_model.dart';
import 'package:nahlachicken/feature/orders/presentation/domain/entity/add_order_entity.dart';

abstract class AddOrderLocalData {
  Future<void> addOrder(
      {required String orderId, required OrderModel orderModel});
  List<List<AddOrderEntity>> getOrder();
  Future<void> deleteOrder(String orderId);
  Future<void> deleteProduct(String orderId, String productId);
  Future<void> deleteAllOrders();
  Future<void> updateOrderStatus(
      {required String orderId, String? orderPaid, String? orderReady});
}

class AddOrderLocalDataImp extends AddOrderLocalData {
  Box<List> get box => Hive.box<List>(kaddOrder);

  @override
  Future<void> addOrder(
      {required String orderId, required OrderModel orderModel}) async {
    final currentList =
        box.get(orderId, defaultValue: [])?.cast<AddOrderEntity>() ?? [];
    currentList.add(orderModel);
    await box.put(orderId, currentList);
  }

  @override
  List<List<AddOrderEntity>> getOrder() {
    return box.values.map((e) => e.cast<AddOrderEntity>()).toList();
  }

  @override
  deleteOrder(String orderId) async {
    await box.delete(orderId);
  }

  @override
  Future<void> deleteProduct(String orderId, String productId) async {
    final currentList = box.get(orderId)?.cast<AddOrderEntity>() ?? [];
    currentList.removeWhere(((element) => element.productId == productId));

    await box.put(orderId, currentList);
  }

  @override
  Future<void> deleteAllOrders() async {
    await box.clear();
  }

  @override
  Future<void> updateOrderStatus(
      {required String orderId, String? orderPaid, String? orderReady}) async {
    final currentList = box.get(orderId)?.cast<AddOrderEntity>() ?? [];

    final updatedList = currentList.map((item) {
      return OrderModel(
        deliveryDriving: item.deliveryDriving,
        phoneNumber: item.phoneNumber,
        isPaid: orderPaid ?? item.isPaid,
        isReady: orderReady ?? item.isReady,
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
      );
    }).toList();

    await box.put(orderId, updatedList);
  }
}
