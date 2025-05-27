import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nahlachicken/core/function/show_tostification.dart';
import 'package:nahlachicken/feature/delivery/data/model/assign_delivery_model.dart';
import 'package:nahlachicken/feature/delivery/presentation/manager/cubit/delivery_cubit.dart';
import 'package:nahlachicken/feature/delivery/presentation/views/widgets/deliveryorder/confirm_dialog_button.dart';

class ConfirmedDeliveryBlocConsumer extends StatelessWidget {
  const ConfirmedDeliveryBlocConsumer({
    super.key,
    required this.deliveryName,
    required this.selectedOrder,
    required this.deliveryId,
  });

  final String deliveryName;
  final List<AssignDeliveryModel> selectedOrder;
  final String deliveryId;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DeliveryCubit, DeliveryState>(
      listener: (context, state) {
        if (state is AddOrderToDeliverySuccess) {
          showTostification(
              context,
              "تمت اضافه الاوردرات علي $deliveryName بنجاح",
              Colors.green,
              Icons.check_circle_outline);
        }
      },
      builder: (context, state) {
        return selectedOrder.isEmpty
            ? SizedBox()
            : ConfirmDialogButton(
                deliveryName: deliveryName, deliveryId: deliveryId);
      },
    );
  }
}
