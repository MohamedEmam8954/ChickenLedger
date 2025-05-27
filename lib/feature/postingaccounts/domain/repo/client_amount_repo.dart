import 'package:nahlachicken/feature/postingaccounts/data/models/client_account_model.dart';
import 'package:nahlachicken/feature/postingaccounts/domain/entities/client_account_entity.dart';

abstract class ClientAmountRepo {
  Future<void> addClient({required ClientAmountModel clientAccountModel});

  List<ClientAccountEntity> getAllClientAmount();
  Future<void> dropClientAmount(String clientId, num price);
  Future<void> addClientAmount(String clientId, num price);
  Future<void> deleteClient(String clientId);
  Future<void> deleteAllClient();
  ClientAccountEntity getClientById(String clientId);
}
