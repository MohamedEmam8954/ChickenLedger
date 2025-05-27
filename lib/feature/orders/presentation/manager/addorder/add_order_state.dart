part of 'add_order_cubit.dart';

@immutable
sealed class AddOrderState {}

final class AddOrderInitial extends AddOrderState {}

final class AddOrderFailure extends AddOrderState {
  final String errorMessage;

  AddOrderFailure({required this.errorMessage});
}

final class AddOrderLoading extends AddOrderState {}

final class AddOrderSucess extends AddOrderState {}

final class GetOrderFailure extends AddOrderState {
  final String errorMessage;

  GetOrderFailure({required this.errorMessage});
}

final class GetOrderLoading extends AddOrderState {}

final class DeleteAllOrderLoading extends AddOrderState {}

final class DeleteAllOrderFailure extends AddOrderState {
  final String errorMessage;
  DeleteAllOrderFailure({required this.errorMessage});
}

final class DeleteAllOrderSucess extends AddOrderState {}

final class GetOrderSucess extends AddOrderState {
  final List<List<AddOrderEntity>> orders;

  GetOrderSucess({required this.orders});
}

final class FilterTypeUpdated extends AddOrderState {
  final String filterType;

  FilterTypeUpdated({required this.filterType});
}

final class EmptyOrders extends AddOrderState {
  final String message;

  EmptyOrders({required this.message});
}
