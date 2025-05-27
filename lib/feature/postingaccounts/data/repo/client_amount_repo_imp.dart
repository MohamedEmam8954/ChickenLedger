import 'package:nahlachicken/feature/postingaccounts/data/dataSource/client_amount_data_source.dart';
import 'package:nahlachicken/feature/postingaccounts/data/models/client_account_model.dart';
import 'package:nahlachicken/feature/postingaccounts/domain/entities/client_account_entity.dart';
import 'package:nahlachicken/feature/postingaccounts/domain/repo/client_amount_repo.dart';

class ClientAmountRepoImp extends ClientAmountRepo {
  final ClientAmountDataSource clientAmountDataSource;

  ClientAmountRepoImp({required this.clientAmountDataSource});

  @override
  Future<void> addClientAmount(String clientId, num price) async {
    return await clientAmountDataSource.addClientAmount(clientId, price);
  }

  @override
  deleteAllClient() async {
    await clientAmountDataSource.deleteAllClient();
  }

  @override
  Future<void> deleteClient(String clientId) async {
    return await clientAmountDataSource.deleteClient(clientId);
  }

  @override
  Future<void> dropClientAmount(String clientId, num price) async {
    return await clientAmountDataSource.dropClientAmount(clientId, price);
  }

  @override
  List<ClientAccountEntity> getAllClientAmount() {
    return clientAmountDataSource.getAllClientAmount();
  }

  @override
  Future<void> addClient(
      {required ClientAmountModel clientAccountModel}) async {
    return await clientAmountDataSource.addClient(
        clientAccountModel: clientAccountModel);
  }

  @override
  ClientAccountEntity getClientById(String clientId) {
    return clientAmountDataSource.getClientById(clientId);
  }
}
