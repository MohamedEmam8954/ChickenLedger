import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nahlachicken/core/widgets/custom_empty_widget.dart';
import 'package:nahlachicken/core/widgets/total_order_delivery.dart';
import 'package:nahlachicken/feature/delivery/presentation/manager/deliveryOrder/cubit/delivery_order_cubit.dart';
import 'package:nahlachicken/feature/delivery/presentation/views/widgets/deliveryorder/delivery_list_bloc_builder.dart';
import 'package:nahlachicken/feature/delivery/presentation/views/widgets/deliveryorder/delivery_orders_listview.dart';

class SearchDeliveryOrderBlocBuilder extends StatelessWidget {
  const SearchDeliveryOrderBlocBuilder({
    super.key,
    required this.deliveryName,
  });
  final String deliveryName;
  @override
  Widget build(BuildContext context) {
    var deliveryCubit = context.read<DeliveryOrderCubit>();
    return BlocBuilder<DeliveryOrderCubit, DeliveryOrderState>(
      builder: (context, state) {
        if (state is OrderSearchEmpty) {
          return CustomEmptyWidget(title: "عذرًا، لا توجد طلبات بهذا الرقم");
        } else if (state is DeliveryOrderSearchSucess) {
          return DeliveryOrdersListView(
            order: state.orders,
          );
        } else {
          return Column(
            children: [
              DeliveryOrderListblocbuilder(),
              TotalOrderDelivery(
                totalPrice: deliveryCubit.totalDeliveryOrders(),
              ),
            ],
          );
        }
      },
    );
  }
}
