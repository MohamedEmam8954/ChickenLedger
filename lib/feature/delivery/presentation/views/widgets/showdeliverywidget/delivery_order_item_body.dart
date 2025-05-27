import 'package:flutter/material.dart';
import 'package:nahlachicken/core/widgets/delivery_info.dart';
import 'package:nahlachicken/core/widgets/orderid_phonenumber.dart';
import 'package:nahlachicken/feature/delivery/domain/entities/assignedDeliveryOrder/assigned_delivery_order_entity.dart';
import 'package:nahlachicken/feature/delivery/domain/entities/deliveryentity/delivery_entity.dart';
import 'package:nahlachicken/feature/delivery/presentation/views/widgets/showdeliverywidget/delete_and_time_order.dart';
import 'package:nahlachicken/feature/delivery/presentation/views/widgets/showdeliverywidget/order_status_section.dart';

class DeliveryOrderItemBody extends StatelessWidget {
  const DeliveryOrderItemBody({
    super.key,
    required this.orders,
    required this.deliveryEntity,
  });

  final AssignedDeliveyOrderEntity orders;
  final DeliveryEntity deliveryEntity;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        OrderIdAndPhoneNumber(
          phoneNumber: orders.phoneNumber,
          orderId: orders.orderId,
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DeliveryInfo(
              color: Colors.orangeAccent,
              icon: Icons.shopping_cart_outlined,
              text: "المنتجات: ${orders.productsNumber}",
            ),
            DeliveryInfo(
              color: Colors.greenAccent,
              icon: Icons.monetization_on,
              text: "الإجمالي: ${orders.totalOrder} ج",
            ),
          ],
        ),
        const SizedBox(height: 10),
        OrdersStatusSection(orders: orders, deliveryEntity: deliveryEntity),
        const SizedBox(height: 12),
        DeleteAndTimeOrder(orders: orders, deliveryEntity: deliveryEntity)
      ],
    );
  }
}
