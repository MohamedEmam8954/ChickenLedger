import 'package:flutter/material.dart';
import 'package:nahlachicken/constant.dart';
import 'package:nahlachicken/feature/delivery/domain/entities/assignedDeliveryOrder/assigned_delivery_order_entity.dart';
import 'package:nahlachicken/feature/delivery/domain/entities/deliveryentity/delivery_entity.dart';
import 'package:nahlachicken/feature/delivery/presentation/views/widgets/showdeliverywidget/delivery_order_item_body.dart';

class ShowDeliveryItem extends StatelessWidget {
  const ShowDeliveryItem(
      {super.key, required this.orders, required this.deliveryEntity});
  final AssignedDeliveyOrderEntity orders;
  final DeliveryEntity deliveryEntity;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xff161819),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
              color: orders.orderStatus == "unpaid"
                  ? kAccentColorLight.withValues(alpha: 0.1)
                  : Colors.greenAccent,
              width: 2),
          boxShadow: [
            BoxShadow(
                color: orders.orderStatus == "unpaid"
                    ? kAccentColorLight
                    : Colors.greenAccent,
                blurRadius: 2.5,
                spreadRadius: 1.5),
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: DeliveryOrderItemBody(
            orders: orders, deliveryEntity: deliveryEntity),
      ),
    );
  }
}
