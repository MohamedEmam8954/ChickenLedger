part of 'delivery_order_cubit.dart';

@immutable
sealed class DeliveryOrderState {}

final class DeliveryOrderInitial extends DeliveryOrderState {}

final class DeliveryOrderLoading extends DeliveryOrderState {}

final class DeliveryOrderSucess extends DeliveryOrderState {
  final List<List<AddOrderEntity>> orders;

  DeliveryOrderSucess({required this.orders});
}

final class DeliveryOrderEmpty extends DeliveryOrderState {
  final String message;

  DeliveryOrderEmpty({required this.message});
}

final class DeliveryOrderFailure extends DeliveryOrderState {
  final String errorMessage;

  DeliveryOrderFailure({required this.errorMessage});
}

final class OrderSearchEmpty extends DeliveryOrderState {}

final class EmptyTextField extends DeliveryOrderState {}

final class DeliveryOrderSearchSucess extends DeliveryOrderState {
  final List<List<AddOrderEntity>> orders;

  DeliveryOrderSearchSucess({required this.orders});
}

final class UpdateFilterSucess extends DeliveryOrderState {}
