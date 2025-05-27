import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nahlachicken/feature/orders/presentation/domain/repo/add_order_repo.dart';

part 'order_status_state.dart';

class OrderStatusCubit extends Cubit<OrderStatusState> {
  OrderStatusCubit(this.addOrderRepo) : super(OrderStatusInitial());

  final AddOrderRepo addOrderRepo;
  Future<void> updateOrderStatus(
      {required String orderId, String? orderPaid, String? orderReady}) async {
    emit(UpdateOrderStatusLoading());
    try {
      await addOrderRepo.updateOrderStatus(
          orderId: orderId, orderPaid: orderPaid, orderReady: orderReady);

      emit(UpdateOrderStatusSucess());
    } catch (e) {
      emit(UpdateOrderStatusFailure(
          errorMessage: "حدث خطا اثناء تحديث الطلب حاول مره اخرى"));
    }
  }
}
