import 'package:flutter/material.dart';
import 'package:nahlachicken/feature/delivery/domain/entities/deliveryentity/delivery_entity.dart';
import 'package:nahlachicken/core/widgets/custom_delivery_data.dart';
import 'package:nahlachicken/feature/delivery/presentation/views/widgets/deliverywidget/delivery_action_buttons.dart';
import 'package:nahlachicken/feature/delivery/presentation/views/widgets/deliverywidget/status_and_delete.dart';
import 'package:nahlachicken/feature/delivery/presentation/views/widgets/deliverywidget/total_and_number_order.dart';

class DeliveryCardItemBody extends StatelessWidget {
  const DeliveryCardItemBody({
    super.key,
    required this.deliveryEntity,
  });

  final DeliveryEntity deliveryEntity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomDataWidget(
            phoneNumber: deliveryEntity.phoneNumber,
            name: deliveryEntity.name,
          ),
          Divider(),
          TotalAndNumbersOrder(deliveryEntity: deliveryEntity),
          SizedBox(height: 10),
          DeleteAndStatus(deliveryEntity: deliveryEntity),
          SizedBox(height: 10),
          DeliveryAcionButtons(deliveryEntity: deliveryEntity)
        ],
      ),
    );
  }
}
