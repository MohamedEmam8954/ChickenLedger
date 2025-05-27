import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nahlachicken/feature/delivery/presentation/manager/cubit/delivery_cubit.dart';
import 'package:nahlachicken/feature/delivery/presentation/views/widgets/deliveryorder/confirmed_delivery_bloc_consumer.dart';

class ConfirmedDeliveryButton extends StatelessWidget {
  const ConfirmedDeliveryButton(
      {super.key, required this.deliveryName, required this.deliveryId});
  final String deliveryName, deliveryId;
  @override
  Widget build(BuildContext context) {
    var selectedOrder = context.read<DeliveryCubit>().selectedOrders;
    return ConfirmedDeliveryBlocConsumer(
        deliveryName: deliveryName,
        selectedOrder: selectedOrder,
        deliveryId: deliveryId);
  }
}
