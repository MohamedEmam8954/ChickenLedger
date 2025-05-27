import 'package:flutter/material.dart';
import 'package:nahlachicken/feature/delivery/domain/entities/assignedDeliveryOrder/assigned_delivery_order_entity.dart';
import 'package:nahlachicken/feature/delivery/domain/entities/deliveryentity/delivery_entity.dart';
import 'package:nahlachicken/feature/delivery/presentation/views/widgets/showdeliverywidget/show_delivery_item.dart';

class SearchedListViewOrders extends StatelessWidget {
  const SearchedListViewOrders(
      {super.key, required this.deliveryEntity, required this.orders});
  final DeliveryEntity deliveryEntity;
  final List<AssignedDeliveyOrderEntity> orders;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: orders.length,
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return ShowDeliveryItem(
          orders: orders[index],
          deliveryEntity: deliveryEntity,
        );
      },
    );
  }
}
