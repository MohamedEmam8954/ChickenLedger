import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nahlachicken/core/widgets/custom_empty_widget.dart';
import 'package:nahlachicken/feature/orders/presentation/manager/addorder/add_order_cubit.dart';
import 'package:nahlachicken/feature/orders/presentation/views/widgets/order_listview.dart';

class CustomOrdersBlocConsumer extends StatelessWidget {
  const CustomOrdersBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddOrderCubit, AddOrderState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is GetOrderSucess) {
            return CustomOrderListView(
              orders: state.orders,
            );
          } else if (state is EmptyOrders) {
            return SliverFillRemaining(
              child: CustomEmptyWidget(title: state.message),
            );
          } else if (state is GetOrderFailure) {
            return SliverFillRemaining(
              child: CustomEmptyWidget(
                title: state.errorMessage,
              ),
            );
          }
          return SliverToBoxAdapter(
            child: SizedBox(),
          );
        });
  }
}
