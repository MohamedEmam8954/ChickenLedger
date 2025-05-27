import 'package:flutter/material.dart';
import 'package:nahlachicken/feature/delivery/domain/entities/deliveryentity/delivery_entity.dart';
import 'package:nahlachicken/feature/delivery/presentation/views/widgets/showdeliverywidget/show_delivery_blocbuilder.dart';

class ShowDeliveryOrderBody extends StatelessWidget {
  const ShowDeliveryOrderBody({super.key, required this.deliveryEntity});
  final DeliveryEntity deliveryEntity;

  @override
  Widget build(BuildContext context) {
    return ShowDeliveryOrderBlocBuilder(deliveryEntity: deliveryEntity);
  }
}
