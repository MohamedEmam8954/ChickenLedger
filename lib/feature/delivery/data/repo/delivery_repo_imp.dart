import 'package:nahlachicken/feature/delivery/data/datasource/delivery_data_source.dart';
import 'package:nahlachicken/feature/delivery/data/model/assign_delivery_model.dart';
import 'package:nahlachicken/feature/delivery/data/model/delivery_model.dart';
import 'package:nahlachicken/feature/delivery/domain/entities/assignedDeliveryOrder/assigned_delivery_order_entity.dart';
import 'package:nahlachicken/feature/delivery/domain/entities/deliveryentity/delivery_entity.dart';
import 'package:nahlachicken/feature/delivery/domain/repo/delivery_repo.dart';

class DeliveryRepoImp extends DeliveryRepo {
  final DeliveryDataSource deliveryDataSource;

  DeliveryRepoImp({required this.deliveryDataSource});
  @override
  Future<void> addDelivery({required DeliveryModel deliveryModel}) {
    return deliveryDataSource.addDelivery(deliveryModel: deliveryModel);
  }

  @override
  List<DeliveryEntity> getDelivery() {
    return deliveryDataSource.getDelivery();
  }

  @override
  Future<void> addOrderToDelivery(
      {required String deliveryId,
      required List<AssignDeliveryModel> newOrder}) {
    return deliveryDataSource.addOrderToDelivery(
        deliveryId: deliveryId, newOrder: newOrder);
  }

  @override
  Future<void> markAsDelivery(
      {required String orderId, required String deliveryDriving}) async {
    return await deliveryDataSource.markAsDelivery(
        orderId: orderId, deliveryDriving: deliveryDriving);
  }

  @override
  Future<void> deleteAllDelivery() async {
    return await deliveryDataSource.deleteAllDelivery();
  }

  @override
  Future<void> deleteDelivery(
      {required String deliveryId,
      required List<AssignedDeliveyOrderEntity> orders}) async {
    return await deliveryDataSource.deleteDelivery(
        deliveryId: deliveryId, orders: orders);
  }

  @override
  Future<void> deleteOrderFromDelivery(
      {required String orderId,
      required String deliverId,
      required num totalOrder}) async {
    return deliveryDataSource.deleteOrderFromDelivery(
        orderId: orderId, deliverId: deliverId, totalOrder: totalOrder);
  }

  @override
  Future<void> deleteAllOrdersFromDelivery(
      {required List<AssignedDeliveyOrderEntity> orders,
      required String deliverId}) async {
    return await deliveryDataSource.deleteAllOrdersFromDelivery(
        orders: orders, deliverId: deliverId);
  }

  @override
  Future<void> updateDeliveryStaus(
      {required String status, required String deliveryId}) async {
    return await deliveryDataSource.updateDeliveryStaus(
        status: status, deliveryId: deliveryId);
  }
}
