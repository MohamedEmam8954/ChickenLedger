import 'package:nahlachicken/feature/postingaccounts/data/models/client_payment_model.dart';
import 'package:nahlachicken/feature/postingaccounts/domain/entities/client_payments_entity.dart';

abstract class ClientPaymentsRepo {
  Future<void> addClientsPayments(ClientPaymentModel clientPaymentModel);
  List<ClientPaymentsEntity> getClientPayments();
}
