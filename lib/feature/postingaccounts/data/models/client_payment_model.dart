import 'package:nahlachicken/feature/postingaccounts/domain/entities/client_payments_entity.dart';

class ClientPaymentModel extends ClientPaymentsEntity {
  ClientPaymentModel(
      {required super.clientId,
      required super.name,
      super.phoneNumber,
      required super.totalPrice,
      required super.dateTime,
      required super.isadded});
}
