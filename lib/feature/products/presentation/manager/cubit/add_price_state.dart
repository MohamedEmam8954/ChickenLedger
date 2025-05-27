part of 'add_price_cubit.dart';

@immutable
sealed class AddPriceState {}

final class AddPriceInitial extends AddPriceState {}

final class AddPriceloading extends AddPriceState {}

final class AddPriceSucess extends AddPriceState {}

final class AddPriceFailure extends AddPriceState {
  final String error;
  AddPriceFailure(this.error);
}

final class GetPriceloading extends AddPriceState {}

final class GetPriceSucess extends AddPriceState {
  final List<AddPriceEntity> getPriceEntity;
  GetPriceSucess(this.getPriceEntity);
}

final class GetPriceFailure extends AddPriceState {
  GetPriceFailure();
}

final class DeleteAllPriceSucess extends AddPriceState {}

final class DeleteAllPriceLoading extends AddPriceState {}

final class DeletePriceFailure extends AddPriceState {
  final String error;
  DeletePriceFailure(this.error);
}
