import 'package:flutter/material.dart';
import 'package:nahlachicken/feature/delivery/domain/entities/deliveryentity/delivery_entity.dart';
import 'package:nahlachicken/feature/delivery/presentation/views/widgets/deliverywidget/delivery_card.dart';

class DeliveryListView extends StatelessWidget {
  const DeliveryListView({super.key, required this.deliveryList});

  final List<DeliveryEntity> deliveryList;

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemBuilder: (context, index) {
        return DeliveryCard(
          deliveryEntity: deliveryList[index],
        );
      },
      itemCount: deliveryList.length,
    );
  }
}
