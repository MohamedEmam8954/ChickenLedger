import 'package:hive/hive.dart';
import 'package:nahlachicken/constant.dart';
import 'package:nahlachicken/feature/postingaccounts/data/models/client_account_model.dart';
import 'package:nahlachicken/feature/postingaccounts/domain/entities/client_account_entity.dart';

abstract class ClientAmountDataSource {
  Future<void> addClient({required ClientAmountModel clientAccountModel});

  List<ClientAccountEntity> getAllClientAmount();
  Future<void> dropClientAmount(String clientId, num price);
  Future<void> addClientAmount(String clientId, num price);
  Future<void> deleteClient(String clientId);
  Future<void> deleteAllClient();
  ClientAccountEntity getClientById(String clientId);
}

class ClientAccountDataSourceImp extends ClientAmountDataSource {
  Box<ClientAccountEntity> get box =>
      Hive.box<ClientAccountEntity>(kAssignClientAccount);
  @override
  Future<void> addClient(
      {required ClientAmountModel clientAccountModel}) async {
    await box.put(clientAccountModel.clientId, clientAccountModel);
  }

  @override
  List<ClientAccountEntity> getAllClientAmount() {
    return box.values.toList();
  }

  @override
  dropClientAmount(String clientId, num price) async {
    var getOldClientAccount = box.get(clientId);
    ClientAmountModel clientAccountModel = ClientAmountModel(
        postAmount: price,
        name: getOldClientAccount!.name,
        totalPrice:
            (getOldClientAccount.totalPrice - price).clamp(0, double.infinity),
        clientId: clientId,
        dateTime: getOldClientAccount.dateTime);

    await box.put(clientId, clientAccountModel);
  }

  @override
  Future<void> addClientAmount(String clientId, num price) async {
    var getOldClientAccount = box.get(clientId);
    ClientAmountModel clientAccountModel = ClientAmountModel(
        addAmount: price,
        name: getOldClientAccount!.name,
        totalPrice:
            (getOldClientAccount.totalPrice + price).clamp(0, double.infinity),
        clientId: clientId,
        dateTime: getOldClientAccount.dateTime);

    await box.put(clientId, clientAccountModel);
  }

  @override
  deleteClient(String clientId) async {
    await box.delete(clientId);
  }

  @override
  deleteAllClient() async {
    await box.clear();
  }

  @override
  ClientAccountEntity getClientById(String clientId) {
    return box.get(clientId)!;
  }
}
