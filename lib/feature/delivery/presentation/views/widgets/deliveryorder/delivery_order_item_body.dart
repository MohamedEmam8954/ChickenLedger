import 'package:flutter/material.dart';
import 'package:nahlachicken/core/widgets/orderid_phonenumber.dart';
import 'package:nahlachicken/feature/delivery/presentation/views/widgets/deliveryorder/order_status_section.dart';
import 'package:nahlachicken/feature/delivery/presentation/views/widgets/deliveryorder/show_order_and_total.dart';
import 'package:nahlachicken/feature/orders/presentation/domain/entity/add_order_entity.dart';
import 'package:nahlachicken/feature/orders/presentation/views/widgets/order_time.dart';

class DeliveryOrdersItemBody extends StatelessWidget {
  const DeliveryOrdersItemBody({
    super.key,
    required this.products,
    required this.totalPrice,
    required this.order,
  });

  final List<AddOrderEntity> products;
  final num totalPrice;
  final AddOrderEntity order;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        OrderIdAndPhoneNumber(
          orderId: products[0].orderId,
          phoneNumber: products[0].phoneNumber,
        ),
        const SizedBox(height: 12),
        ShowProductsAndTotal(products: products, totalPrice: totalPrice),
        const SizedBox(height: 10),
        OrderStatusSection(order: order),
        const SizedBox(height: 12),
        OrderTime(orderDate: order.dateTime),
      ],
    );
  }
}
