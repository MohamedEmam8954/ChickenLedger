import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nahlachicken/constant.dart';
import 'package:nahlachicken/core/function/navgaition.dart';
import 'package:nahlachicken/core/function/show_delete_all_dialog.dart';
import 'package:nahlachicken/feature/delivery/presentation/manager/cubit/delivery_cubit.dart';
import 'package:nahlachicken/feature/delivery/presentation/manager/deliveryOrder/cubit/delivery_order_cubit.dart';

class ConfirmDialogButton extends StatelessWidget {
  const ConfirmDialogButton({
    super.key,
    required this.deliveryName,
    required this.deliveryId,
  });

  final String deliveryName;
  final String deliveryId;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        buildDialogButton(context);
      },
      icon: Icon(
        Icons.check,
        color: kAccentColorDark,
      ),
    );
  }

  void buildDialogButton(BuildContext context) {
    buildDialog(
        context: context,
        title: "هل تريد اضافه الاوردرات علي $deliveryName",
        onTapTrue: () {
          context
              .read<DeliveryCubit>()
              .confirmSelectedOrders(deliveryId, deliveryName);
          context
              .read<DeliveryOrderCubit>()
              .applyFilter(context.read<DeliveryOrderCubit>().getFilter());
          popFromScreen(context);
        },
        textTrue: "نعم",
        textFalse: "لا",
        onTapFalse: () {
          context.read<DeliveryCubit>().unConfimedSelectOrder();
          context
              .read<DeliveryOrderCubit>()
              .applyFilter(context.read<DeliveryOrderCubit>().getFilter());
          popFromScreen(context);
        });
  }
}
