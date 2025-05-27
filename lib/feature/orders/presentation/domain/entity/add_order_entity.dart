import 'package:hive/hive.dart';
part 'add_order_entity.g.dart';

@HiveType(typeId: 1)
class AddOrderEntity {
  @HiveField(0)
  final bool isDelivery;
  @HiveField(1)
  final bool isOnSale;
  @HiveField(2)
  final String orderId;
  @HiveField(3)
  final bool isFreeDelivery;
  @HiveField(4)
  final String type;
  @HiveField(5)
  final String productId;
  @HiveField(6)
  final num cleaningPrice;
  @HiveField(7)
  final num priceWithDiscount;
  @HiveField(8)
  final num priceWithoutDiscount;
  @HiveField(9)
  final num numberOfKilo;
  @HiveField(10)
  final num totalPrice;
  @HiveField(11)
  final DateTime dateTime;
  @HiveField(12)
  final String category;
  @HiveField(13)
  final String quantity;
  @HiveField(14)
  final String isReady;
  @HiveField(15)
  final String isPaid;
  @HiveField(16)
  final String phoneNumber;
  @HiveField(17)
  final String deliveryDriving;

  AddOrderEntity({
    required this.phoneNumber,
    required this.isPaid,
    required this.isReady,
    required this.quantity,
    required this.isDelivery,
    required this.isOnSale,
    required this.orderId,
    required this.isFreeDelivery,
    required this.category,
    required this.type,
    required this.productId,
    required this.cleaningPrice,
    required this.priceWithDiscount,
    required this.priceWithoutDiscount,
    required this.numberOfKilo,
    required this.totalPrice,
    required this.dateTime,
    required this.deliveryDriving,
  });
}
