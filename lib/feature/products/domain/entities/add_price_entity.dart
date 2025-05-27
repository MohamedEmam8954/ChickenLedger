import 'package:hive_flutter/adapters.dart';
part 'add_price_entity.g.dart';

@HiveType(typeId: 0)
class AddPriceEntity {
  @HiveField(0)
  final String type;
  @HiveField(1)
  final num priceWithOutDiscount;
  @HiveField(2)
  final String category;
  @HiveField(3)
  final String productId;
  @HiveField(4)
  final String numberOfKilo;
  @HiveField(5)
  final num priceWithDiscount;
  @HiveField(6)
  final bool isOnSale;

  AddPriceEntity(
      {required this.type,
      required this.priceWithOutDiscount,
      required this.category,
      required this.productId,
      required this.numberOfKilo,
      required this.priceWithDiscount,
      required this.isOnSale});
}
