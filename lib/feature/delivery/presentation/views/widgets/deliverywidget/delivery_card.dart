import 'package:flutter/material.dart';
import 'package:nahlachicken/constant.dart';
import 'package:nahlachicken/feature/delivery/domain/entities/deliveryentity/delivery_entity.dart';
import 'package:nahlachicken/feature/delivery/presentation/views/widgets/deliverywidget/delivery_card_item_body.dart';

class DeliveryCard extends StatelessWidget {
  const DeliveryCard({
    super.key,
    required this.deliveryEntity,
  });

  final DeliveryEntity deliveryEntity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xff161819),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
              color: deliveryEntity.deliveryStatus == 'unPaid'
                  ? kAccentColorLight.withValues(alpha: 0.1)
                  : Colors.greenAccent.withValues(alpha: 0.1),
              width: 2),
          boxShadow: [
            BoxShadow(
                color: deliveryEntity.deliveryStatus == 'unPaid'
                    ? kAccentColorLight
                    : Colors.greenAccent,
                blurRadius: 2.5,
                spreadRadius: 1.5),
          ],
        ),
        child: DeliveryCardItemBody(deliveryEntity: deliveryEntity),
      ),
    );
  }
}
