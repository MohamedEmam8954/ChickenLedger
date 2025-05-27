part of 'delivery_cubit.dart';

@immutable
sealed class DeliveryState {}

final class DeliveryInitial extends DeliveryState {}

final class AddDeliveryLoading extends DeliveryState {}

final class AddDeliveryFailure extends DeliveryState {
  final String errorMessage;
  AddDeliveryFailure({required this.errorMessage});
}

final class AddDeliverySucess extends DeliveryState {}

final class GetDeliveryLoading extends DeliveryState {}

final class GetDeliveryEmpty extends DeliveryState {
  final String message;

  GetDeliveryEmpty({required this.message});
}

final class GetDeliveryFailure extends DeliveryState {
  final String errorMessage;
  GetDeliveryFailure({required this.errorMessage});
}

final class GetDeliverySucess extends DeliveryState {
  final List<DeliveryEntity> deliveryList;

  GetDeliverySucess({required this.deliveryList});
}

final class ToggleOrderSelctionSucess extends DeliveryState {}

final class AddOrderToDeliverySuccess extends DeliveryState {}

final class DeliverySearchSucess extends DeliveryState {
  final List<DeliveryEntity> deliveryFilter;

  DeliverySearchSucess({required this.deliveryFilter});
}

final class DeliverySearchLoading extends DeliveryState {}

final class DeliverySearchEmpty extends DeliveryState {
  final String errorMessage;

  DeliverySearchEmpty({required this.errorMessage});
}

final class UpdateFilterSucess extends DeliveryState {}
