part of 'show_delivery_order_cubit.dart';

@immutable
sealed class ShowDeliveryOrderState {}

final class ShowDeliveryOrderInitial extends ShowDeliveryOrderState {}

final class UpdateDeliveryOrderSucess extends ShowDeliveryOrderState {
  final DeliveryEntity deliveryEntity;

  UpdateDeliveryOrderSucess({required this.deliveryEntity});
}

final class DeleteDeliveryOrderLoading extends ShowDeliveryOrderState {}

final class EmptyDeliveryOrder extends ShowDeliveryOrderState {}

final class UpdateTotalOrders extends ShowDeliveryOrderState {
  final num total;

  UpdateTotalOrders({required this.total});
}

final class DeleteDeliveryOrderFailure extends ShowDeliveryOrderState {
  final String errorMessage;

  DeleteDeliveryOrderFailure({required this.errorMessage});
}

final class EmptySearchOrder extends ShowDeliveryOrderState {}

final class LoadingSearchOrder extends ShowDeliveryOrderState {}

final class SearchOrderSucess extends ShowDeliveryOrderState {
  final List<AssignedDeliveyOrderEntity> orders;

  SearchOrderSucess({required this.orders});
}
