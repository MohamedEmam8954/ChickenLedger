import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nahlachicken/feature/postingaccounts/data/models/client_account_model.dart';
import 'package:nahlachicken/feature/postingaccounts/data/models/client_payment_model.dart';
import 'package:nahlachicken/feature/postingaccounts/domain/entities/client_account_entity.dart';
import 'package:nahlachicken/feature/postingaccounts/domain/entities/client_payments_entity.dart';
import 'package:nahlachicken/feature/postingaccounts/domain/repo/client_amount_repo.dart';
import 'package:nahlachicken/feature/postingaccounts/domain/repo/client_payments_repo.dart';

part 'client_amount_state.dart';

class ClientAmountCubit extends Cubit<ClientAmountState> {
  ClientAmountCubit(
      {required this.clientAmountRepo, required this.clientPaymentsRepo})
      : super(ClientAmountInitial());

  final ClientAmountRepo clientAmountRepo;
  final ClientPaymentsRepo clientPaymentsRepo;

  Future<void> addClient(
      {required ClientAmountModel clientAccountModel}) async {
    try {
      emit(AddClientLoading());
      await clientAmountRepo.addClient(clientAccountModel: clientAccountModel);
      emit(AddClientSucess());
    } catch (e) {
      emit(AddClientFailure(
          errorMessage: "oops there were a problem try Again"));
    }
  }

  getAllClientAmount() {
    var clientAmountList = clientAmountRepo.getAllClientAmount();
    if (clientAmountList.isEmpty) {
      emit(ClientAmountEmpty(message: "لا يوجد عملاء"));
    } else {
      emit(ClientAmountSucess(clientsList: clientAmountList));
    }
  }

  Future<void> dropClientAmount(String clientId, num price) async {
    await clientAmountRepo.dropClientAmount(clientId, price);
    getAllClientAmount();
  }

  Future<void> addClientAmount(String clientId, num price) async {
    await clientAmountRepo.addClientAmount(clientId, price);
    getAllClientAmount();
  }

  Future<void> deleteClient(String clientId) async {
    await clientAmountRepo.deleteClient(clientId);
    getAllClientAmount();
  }

  void deleteAllClient() async {
    await clientAmountRepo.deleteAllClient();
    getAllClientAmount();
  }

  Future<void> addClientsPayments(
      {required String clientId,
      required String name,
      required num totalPrice,
      required isAdded}) async {
    await clientPaymentsRepo.addClientsPayments(
      ClientPaymentModel(
          clientId: clientId,
          name: name,
          totalPrice: totalPrice,
          dateTime: DateTime.now(),
          isadded: isAdded),
    );
  }

  getClientPaymentsById(String clientId) {
    var getClientPayments = clientPaymentsRepo.getClientPayments();

    var getclientpayment = getClientPayments
        .where((clients) => clients.clientId == clientId)
        .toList();

    getclientpayment.sort((a, b) => b.dateTime.compareTo(a.dateTime));
    if (getclientpayment.isEmpty) {
      emit(ClientPaymentsEmpty());
    } else {
      emit(ClientPaymentsSucess(clientPayments: getclientpayment));
    }
  }

  searchClient({required String searchText}) {
    var clientAmountList = clientAmountRepo.getAllClientAmount();

    var searchResult = clientAmountList.where((client) {
      return client.name.contains(searchText) ||
          (client.phoneNumber != null &&
              client.phoneNumber!.contains(searchText));
    }).toList();
    if (searchResult.isEmpty) {
      emit(
          ClientSearchEmpty(message: "لا يوجد عملاء بهذا الاسم او بهذا الرقم"));
    } else {
      emit(ClientSearchSucess(clientsList: searchResult));
    }
  }
}
