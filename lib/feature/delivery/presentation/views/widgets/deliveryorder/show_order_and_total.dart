import 'package:flutter/material.dart';
import 'package:nahlachicken/core/widgets/delivery_info.dart';
import 'package:nahlachicken/feature/orders/presentation/domain/entity/add_order_entity.dart';

class ShowProductsAndTotal extends StatelessWidget {
  const ShowProductsAndTotal({
    super.key,
    required this.products,
    required this.totalPrice,
  });

  final List<AddOrderEntity> products;
  final num totalPrice;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        DeliveryInfo(
          color: Colors.orangeAccent,
          icon: Icons.shopping_cart_outlined,
          text: "المنتجات: ${products.length}",
        ),
        DeliveryInfo(
          color: Colors.greenAccent,
          icon: Icons.monetization_on,
          text: "الإجمالي: $totalPrice ج",
        ),
      ],
    );
  }
}
