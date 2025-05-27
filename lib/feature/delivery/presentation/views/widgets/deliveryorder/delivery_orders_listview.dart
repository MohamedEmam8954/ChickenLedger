import 'package:flutter/material.dart';
import 'package:nahlachicken/feature/delivery/presentation/views/widgets/deliveryorder/delivery_order_item.dart';
import 'package:nahlachicken/feature/orders/presentation/domain/entity/add_order_entity.dart';

class DeliveryOrdersListView extends StatelessWidget {
  const DeliveryOrdersListView({
    super.key,
    required this.order,
  });

  final List<List<AddOrderEntity>> order;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: order.length,
      itemBuilder: (context, index) {
        return DeliveryOrdersItem(
          products: order[index],
        );
      },
    );
  }
}
