import 'package:hive_flutter/adapters.dart';
part 'client_account_entity.g.dart';

@HiveType(typeId: 4)
class ClientAccountEntity {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String? phoneNumber;
  @HiveField(2)
  final num totalPrice;
  @HiveField(3)
  final num? addAmount;
  @HiveField(4)
  final num? postAmount;
  @HiveField(5)
  final String clientId;
  @HiveField(6)
  final DateTime dateTime;

  ClientAccountEntity(
      {required this.name,
      required this.phoneNumber,
      required this.totalPrice,
      required this.addAmount,
      required this.postAmount,
      required this.clientId,
      required this.dateTime});
}
