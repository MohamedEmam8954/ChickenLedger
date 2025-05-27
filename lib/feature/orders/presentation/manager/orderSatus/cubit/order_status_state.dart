part of 'order_status_cubit.dart';

@immutable
sealed class OrderStatusState {}

final class OrderStatusInitial extends OrderStatusState {}

final class UpdateOrderStatusSucess extends OrderStatusState {}

final class UpdateOrderStatusLoading extends OrderStatusState {}

final class UpdateOrderStatusFailure extends OrderStatusState {
  final String errorMessage;

  UpdateOrderStatusFailure({required this.errorMessage});
}
