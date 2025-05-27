import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nahlachicken/core/widgets/custom_empty_widget.dart';
import 'package:nahlachicken/feature/orders/presentation/manager/addorder/add_order_cubit.dart';
import 'package:nahlachicken/feature/orders/presentation/views/widgets/custom_order_list.dart';

class OrderViewBody extends StatelessWidget {
  const OrderViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddOrderCubit, AddOrderState>(
      builder: (context, state) {
        var getOrders = context.read<AddOrderCubit>().ordersList;

        return getOrders.isEmpty
            ? CustomEmptyWidget(title: "لا توجد اوردرات الان")
            : CustomOrdersList();
      },
    );
  }
}
