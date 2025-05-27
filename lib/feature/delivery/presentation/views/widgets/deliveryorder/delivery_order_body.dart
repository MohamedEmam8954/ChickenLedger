import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nahlachicken/feature/delivery/presentation/manager/deliveryOrder/cubit/delivery_order_cubit.dart';
import 'package:nahlachicken/feature/delivery/presentation/views/widgets/deliveryorder/delivery_order_blocbuilder.dart';

class DeliveryOrdersBody extends StatefulWidget {
  const DeliveryOrdersBody({super.key, required this.deliveryName});
  final String deliveryName;
  @override
  State<DeliveryOrdersBody> createState() => _DeliveryOrdersBodyState();
}

class _DeliveryOrdersBodyState extends State<DeliveryOrdersBody> {
  @override
  void initState() {
    context
        .read<DeliveryOrderCubit>()
        .applyFilter(context.read<DeliveryOrderCubit>().getFilter());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Expanded(
            child: DeliveryOrdersBlocBuilder(deliveryName: widget.deliveryName),
          ),
        ],
      ),
    );
  }
}
