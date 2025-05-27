import 'package:hive/hive.dart';
import 'package:nahlachicken/constant.dart';
import 'package:nahlachicken/feature/postingaccounts/data/models/client_payment_model.dart';
import 'package:nahlachicken/feature/postingaccounts/domain/entities/client_payments_entity.dart';

abstract class ClientPaymentsDataSource {
  Future<void> addClientsPayments(ClientPaymentModel clientPaymentModel);
  List<ClientPaymentsEntity> getClientPayments();
}

class ClientPaymentsDataSourceImp extends ClientPaymentsDataSource {
  Box<ClientPaymentsEntity> get clientPaymentsBox =>
      Hive.box<ClientPaymentsEntity>(kClientPayments);
  @override
  Future<void> addClientsPayments(ClientPaymentModel clientPaymentModel) async {
    await clientPaymentsBox.add(clientPaymentModel);
  }

  @override
  List<ClientPaymentsEntity> getClientPayments() {
    return clientPaymentsBox.values.toList();
  }
}
