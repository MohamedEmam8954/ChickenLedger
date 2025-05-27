import 'package:nahlachicken/feature/postingaccounts/data/dataSource/client_payments_data_source.dart';
import 'package:nahlachicken/feature/postingaccounts/data/models/client_payment_model.dart';
import 'package:nahlachicken/feature/postingaccounts/domain/entities/client_payments_entity.dart';
import 'package:nahlachicken/feature/postingaccounts/domain/repo/client_payments_repo.dart';

class ClientPaymentsRepoImp extends ClientPaymentsRepo {
  final ClientPaymentsDataSource clientPaymentsDataSource;

  ClientPaymentsRepoImp({required this.clientPaymentsDataSource});

  @override
  Future<void> addClientsPayments(ClientPaymentModel clientPaymentModel) async {
    await clientPaymentsDataSource.addClientsPayments(clientPaymentModel);
  }

  @override
  List<ClientPaymentsEntity> getClientPayments() {
    return clientPaymentsDataSource.getClientPayments();
  }
}
