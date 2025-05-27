import 'package:flutter/material.dart';
import 'package:nahlachicken/feature/delivery/domain/entities/assignedDeliveryOrder/assigned_delivery_order_entity.dart';
import 'package:nahlachicken/feature/delivery/domain/entities/deliveryentity/delivery_entity.dart';

import 'package:nahlachicken/feature/orders/presentation/views/widgets/order_status.dart';

class OrdersStatusSection extends StatelessWidget {
  const OrdersStatusSection(
      {super.key, required this.orders, required this.deliveryEntity});

  final AssignedDeliveyOrderEntity orders;
  final DeliveryEntity deliveryEntity;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        OrderStaus(
          color: orders.orderStatus == "unpaid"
              ? Colors.redAccent
              : Colors.greenAccent,
          text:
              orders.orderStatus == "unpaid" ? "غير مدفوع" : "مدفوع انستا باي",
        ),
        OrderStaus(
            color: Colors.greenAccent, text: "مع ${deliveryEntity.name}"),
        OrderStaus(
          color: orders.orderUnready == "unReady"
              ? Colors.purpleAccent
              : Colors.greenAccent,
          text: orders.orderUnready == "unReady" ? "غير جاهز" : "جاهز",
        ),
      ],
    );
  }
}
