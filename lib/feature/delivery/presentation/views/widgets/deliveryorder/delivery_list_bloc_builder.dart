import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nahlachicken/core/widgets/custom_loading.dart';
import 'package:nahlachicken/feature/delivery/presentation/manager/deliveryOrder/cubit/delivery_order_cubit.dart';
import 'package:nahlachicken/feature/delivery/presentation/views/widgets/deliveryorder/delivery_orders_listview.dart';

class DeliveryOrderListblocbuilder extends StatelessWidget {
  const DeliveryOrderListblocbuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DeliveryOrderCubit, DeliveryOrderState>(
      builder: (context, state) {
        if (state is DeliveryOrderSucess) {
          return Expanded(
            child: DeliveryOrdersListView(
              order: state.orders,
            ),
          );
        } else {
          return Expanded(child: Center(child: Loading()));
        }
      },
    );
  }
}
