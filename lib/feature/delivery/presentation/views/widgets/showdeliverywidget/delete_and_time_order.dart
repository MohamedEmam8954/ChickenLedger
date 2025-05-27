import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:nahlachicken/constant.dart';
import 'package:nahlachicken/core/function/show_tostification.dart';
import 'package:nahlachicken/core/function/time_with_12hour.dart';
import 'package:nahlachicken/feature/delivery/domain/entities/assignedDeliveryOrder/assigned_delivery_order_entity.dart';
import 'package:nahlachicken/feature/delivery/domain/entities/deliveryentity/delivery_entity.dart';
import 'package:nahlachicken/feature/delivery/presentation/manager/showdeliveryorder/cubit/show_delivery_order_cubit.dart';

class DeleteAndTimeOrder extends StatelessWidget {
  const DeleteAndTimeOrder({
    super.key,
    required this.orders,
    required this.deliveryEntity,
  });

  final AssignedDeliveyOrderEntity orders;
  final DeliveryEntity deliveryEntity;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      textDirection: TextDirection.ltr,
      children: [
        Text(
          timeWith12Hour(DateTime.parse(orders.orderDate)),
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[800],
            fontWeight: FontWeight.w500,
          ),
        ),
        IconButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            context.read<ShowDeliveryOrderCubit>().deleteOrderFromDelivery(
                orderId: orders.orderId,
                deliverId: deliveryEntity.deliveryid,
                totalOrder: orders.totalOrder);
            context
                .read<ShowDeliveryOrderCubit>()
                .getdelivery(deliveryEntity.deliveryid);
            showTostification(
                context,
                "تم حذف الاوردر من علي ${deliveryEntity.name} بنجاح",
                Colors.green,
                Icons.check);
          },
          icon: Icon(
            IconlyLight.delete,
            color: kAccentColorDark,
          ),
        ),
      ],
    );
  }
}
