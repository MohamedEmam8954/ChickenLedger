import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nahlachicken/core/widgets/custom_empty_widget.dart';
import 'package:nahlachicken/feature/delivery/presentation/manager/deliveryOrder/cubit/delivery_order_cubit.dart';
import 'package:nahlachicken/feature/delivery/presentation/views/widgets/deliveryorder/deliveries_order_section.dart';

class DeliveryOrdersBlocBuilder extends StatelessWidget {
  const DeliveryOrdersBlocBuilder({
    super.key,
    required this.deliveryName,
  });

  final String deliveryName;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DeliveryOrderCubit, DeliveryOrderState>(
      builder: (context, state) {
        if (state is DeliveryOrderEmpty) {
          return CustomEmptyWidget(title: state.message);
        }
        return DeliveriesOrdersSection(
          deliveryName: deliveryName,
        );
      },
    );
  }
}
