import 'package:flutter/material.dart';
import 'package:nahlachicken/feature/delivery/domain/entities/deliveryentity/delivery_entity.dart';
import 'package:nahlachicken/feature/delivery/presentation/views/widgets/deliverywidget/add_order_to_delivery_button.dart';
import 'package:nahlachicken/feature/delivery/presentation/views/widgets/deliverywidget/show_order_button.dart';

class DeliveryAcionButtons extends StatelessWidget {
  const DeliveryAcionButtons({
    super.key,
    required this.deliveryEntity,
  });

  final DeliveryEntity deliveryEntity;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: AddOrderToDeliveryButton(deliveryEntity: deliveryEntity),
        ),
        SizedBox(width: 10),
        Expanded(
          child: ShowOrderButton(deliveryEntity: deliveryEntity),
        ),
      ],
    );
  }
}
