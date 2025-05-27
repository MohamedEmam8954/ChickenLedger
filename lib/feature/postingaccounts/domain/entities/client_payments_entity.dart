import 'package:hive/hive.dart';

part 'client_payments_entity.g.dart';

@HiveType(typeId: 5)
class ClientPaymentsEntity {
  @HiveField(0)
  final String clientId;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String? phoneNumber;
  @HiveField(3)
  final num totalPrice;
  @HiveField(4)
  final DateTime dateTime;
  @HiveField(5)
  final bool isadded;

  ClientPaymentsEntity(
      {required this.clientId,
      required this.name,
      this.phoneNumber,
      required this.totalPrice,
      required this.dateTime,
      required this.isadded});
}
