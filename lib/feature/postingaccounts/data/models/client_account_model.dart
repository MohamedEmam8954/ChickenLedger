import 'package:nahlachicken/feature/postingaccounts/domain/entities/client_account_entity.dart';

class ClientAmountModel extends ClientAccountEntity {
  ClientAmountModel(
      {required super.name,
      super.phoneNumber,
      required super.totalPrice,
      super.addAmount,
      super.postAmount,
      required super.clientId,
      required super.dateTime});
}
