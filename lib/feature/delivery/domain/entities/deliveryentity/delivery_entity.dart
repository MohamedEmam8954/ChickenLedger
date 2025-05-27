import 'package:hive/hive.dart';

import 'package:nahlachicken/feature/delivery/domain/entities/assignedDeliveryOrder/assigned_delivery_order_entity.dart';

part 'delivery_entity.g.dart';

@HiveType(typeId: 2)
class DeliveryEntity {
  @HiveField(0)
  final String deliveryid;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String? phoneNumber;
  @HiveField(3)
  final num totalPrice;
  @HiveField(4)
  final int orderNumber;
  @HiveField(5)
  final String deliveryStatus;
  @HiveField(6)
  final DateTime? deliveryTime;
  @HiveField(7)
  final List<AssignedDeliveyOrderEntity> orders;
  @HiveField(8)
  final String deliveryDriving;

  DeliveryEntity(
      {required this.deliveryid,
      required this.name,
      this.phoneNumber,
      required this.deliveryDriving,
      required this.totalPrice,
      required this.orderNumber,
      required this.deliveryStatus,
      required this.deliveryTime,
      required this.orders});
}
