import 'package:flutter/material.dart';
import 'package:nahlachicken/feature/delivery/presentation/views/widgets/deliverywidget/delivery_view_body_blocbuilder.dart';

class DeliveryViewBody extends StatelessWidget {
  const DeliveryViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: DeliveryViewBodyBlocBuilder(),
    );
  }
}
