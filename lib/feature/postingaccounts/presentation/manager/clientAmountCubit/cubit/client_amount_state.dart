part of 'client_amount_cubit.dart';

@immutable
sealed class ClientAmountState {}

final class ClientAmountInitial extends ClientAmountState {}

final class AddClientLoading extends ClientAmountState {}

final class AddClientSucess extends ClientAmountState {}

final class AddClientFailure extends ClientAmountState {
  final String errorMessage;

  AddClientFailure({required this.errorMessage});
}

final class ClientAmountSucess extends ClientAmountState {
  final List<ClientAccountEntity> clientsList;

  ClientAmountSucess({required this.clientsList});
}

final class ClientAmountEmpty extends ClientAmountState {
  final String message;

  ClientAmountEmpty({required this.message});
}

final class DropClientLoading extends ClientAmountState {}

final class DropClientSucess extends ClientAmountState {
  final ClientAccountEntity clientAccountEntity;

  DropClientSucess({required this.clientAccountEntity});
}

final class ClientPaymentsEmpty extends ClientAmountState {}

final class ClientPaymentsSucess extends ClientAmountState {
  final List<ClientPaymentsEntity> clientPayments;

  ClientPaymentsSucess({required this.clientPayments});
}

final class ClientSearchEmpty extends ClientAmountState {
  final String message;

  ClientSearchEmpty({required this.message});
}

final class ClientSearchSucess extends ClientAmountState {
  final List<ClientAccountEntity> clientsList;

  ClientSearchSucess({required this.clientsList});
}
