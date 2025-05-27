import 'package:nahlachicken/feature/delivery/data/model/assign_delivery_model.dart';
import 'package:nahlachicken/feature/delivery/data/model/delivery_model.dart';
import 'package:nahlachicken/feature/delivery/domain/entities/assignedDeliveryOrder/assigned_delivery_order_entity.dart';
import 'package:nahlachicken/feature/delivery/domain/entities/deliveryentity/delivery_entity.dart';

abstract class DeliveryRepo {
  Future<void> addDelivery({required DeliveryModel deliveryModel});

  List<DeliveryEntity> getDelivery();

  Future<void> addOrderToDelivery(
      {required String deliveryId,
      required List<AssignDeliveryModel> newOrder});

  Future<void> markAsDelivery(
      {required String orderId, required String deliveryDriving});

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
