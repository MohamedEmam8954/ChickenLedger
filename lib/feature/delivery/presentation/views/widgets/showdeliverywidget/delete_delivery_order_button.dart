import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:nahlachicken/constant.dart';
import 'package:nahlachicken/core/function/show_delete_all_dialog.dart';
import 'package:nahlachicken/feature/delivery/domain/entities/assignedDeliveryOrder/assigned_delivery_order_entity.dart';
import 'package:nahlachicken/feature/delivery/presentation/manager/showdeliveryorder/cubit/show_delivery_order_cubit.dart';

class DeleteDeliveryOrdersButton extends StatelessWidget {
  const DeleteDeliveryOrdersButton({
    super.key,
    required this.deliveryName,
    required this.orders,
    required this.deliveryId,
  });

  final String deliveryName;
  final List<AssignedDeliveyOrderEntity> orders;
  final String deliveryId;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        var cubit = context.read<ShowDeliveryOrderCubit>();
        buildDialog(
            textFalse: "إلغاء",
            context: context,
            title: "هل أنت متأكد أنك تريد حذف الاوردرات من علي $deliveryName ؟",
            onTapTrue: () {
              cubit.deleteAllOrdersFromDelivery(
                  orders: orders, deliveryId: deliveryId);
              Navigator.pop(context);
            },
            textTrue: "نعم، احذف",
            onTapFalse: () {
              Navigator.pop(context);
            });
      },
      icon: Icon(
        IconlyLight.delete,
        color: kAccentColorDark,
      ),
    );
  }
}
