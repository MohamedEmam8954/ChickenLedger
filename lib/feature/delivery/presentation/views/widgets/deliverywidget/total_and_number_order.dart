import 'package:flutter/material.dart';
import 'package:nahlachicken/core/widgets/delivery_info.dart';
import 'package:nahlachicken/feature/delivery/domain/entities/deliveryentity/delivery_entity.dart';

class TotalAndNumbersOrder extends StatelessWidget {
  const TotalAndNumbersOrder({
    super.key,
    required this.deliveryEntity,
  });

  final DeliveryEntity deliveryEntity;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        DeliveryInfo(
            color: Colors.orangeAccent,
            icon: Icons.shopping_cart_outlined,
            text: "الطلبات: ${deliveryEntity.orderNumber}"),
        DeliveryInfo(
            color: Colors.greenAccent,
            icon: Icons.monetization_on,
            text: "الإجمالي: ${deliveryEntity.totalPrice} ج"),
      ],
    );
  }
}
