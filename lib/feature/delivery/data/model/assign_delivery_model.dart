import 'package:nahlachicken/feature/delivery/domain/entities/assignedDeliveryOrder/assigned_delivery_order_entity.dart';

class AssignDeliveryModel extends AssignedDeliveyOrderEntity {
  AssignDeliveryModel({
    required super.orderId,
    required super.productsNumber,
    required super.phoneNumber,
    required super.totalOrder,
    required super.orderStatus,
    required super.orderUnready,
    required super.orderDate,
    required super.deliveryDriving,
  });
}
