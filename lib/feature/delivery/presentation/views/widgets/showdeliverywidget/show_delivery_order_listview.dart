import 'package:flutter/material.dart';
import 'package:nahlachicken/feature/delivery/domain/entities/deliveryentity/delivery_entity.dart';
import 'package:nahlachicken/feature/delivery/presentation/views/widgets/showdeliverywidget/show_delivery_item.dart';

class ShowDeliveryOrdersListView extends StatelessWidget {
  const ShowDeliveryOrdersListView({
    super.key,
    required this.deliveryEntity,
  });

  final DeliveryEntity deliveryEntity;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: deliveryEntity.orders.length,
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return ShowDeliveryItem(
          orders: deliveryEntity.orders[index],
          deliveryEntity: deliveryEntity,
        );
      },
    );
  }
}
