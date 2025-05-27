import 'package:flutter/material.dart';
import 'package:nahlachicken/feature/orders/presentation/domain/entity/add_order_entity.dart';
import 'package:nahlachicken/feature/orders/presentation/views/widgets/order_status.dart';

class OrderStatusSection extends StatelessWidget {
  const OrderStatusSection({
    super.key,
    required this.order,
  });

  final AddOrderEntity order;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        OrderStaus(
          color:
              order.isPaid == "unpaid" ? Colors.redAccent : Colors.greenAccent,
          text: order.isPaid == "unpaid" ? "غير مدفوع" : "مدفوع انستا باي",
        ),
        OrderStaus(
          color: order.deliveryDriving.isNotEmpty
              ? Colors.greenAccent
              : Colors.orangeAccent,
          text: order.deliveryDriving.isNotEmpty
              ? "مع ${order.deliveryDriving}"
              : "في انتظار التوصيل",
        ),
        OrderStaus(
          color: order.isReady == "unReady"
              ? Colors.purpleAccent
              : Colors.greenAccent,
          text: order.isReady == "unReady" ? "غير جاهز" : "جاهز",
        ),
      ],
    );
  }
}
