import 'package:flutter/material.dart';

import 'package:nahlachicken/feature/orders/presentation/domain/entity/add_order_entity.dart';
import 'package:nahlachicken/feature/orders/presentation/views/widgets/custom_orders_item.dart';

class CustomOrderListView extends StatelessWidget {
  const CustomOrderListView({super.key, required this.orders});
  final List<List<AddOrderEntity>> orders;

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: orders.length,
      itemBuilder: (context, index) {
        return CustomOrdersItem(
          orderItem: orders[index],
        );
      },
    );
  }
}
