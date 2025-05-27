import 'package:hive/hive.dart';
part 'assigned_delivery_order_entity.g.dart';

@HiveType(typeId: 3)
class AssignedDeliveyOrderEntity {
  @HiveField(0)
  final String orderId;
  @HiveField(1)
  final int productsNumber;
  @HiveField(2)
  final String phoneNumber;
  @HiveField(3)
  final num totalOrder;
  @HiveField(4)
  final String orderStatus;
  @HiveField(5)
  final String orderUnready;
  @HiveField(6)
  final String orderDate;
  @HiveField(7)
  final String deliveryDriving;

  AssignedDeliveyOrderEntity(
      {required this.orderId,
      required this.productsNumber,
      required this.phoneNumber,
      required this.totalOrder,
      required this.orderStatus,
      required this.orderUnready,
      required this.orderDate,
      required this.deliveryDriving});
}
