import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nahlachicken/core/widgets/custom_empty_widget.dart';
import 'package:nahlachicken/core/widgets/custom_loading.dart';
import 'package:nahlachicken/feature/delivery/domain/entities/deliveryentity/delivery_entity.dart';
import 'package:nahlachicken/feature/delivery/presentation/manager/showdeliveryorder/cubit/show_delivery_order_cubit.dart';
import 'package:nahlachicken/feature/delivery/presentation/views/widgets/showdeliverywidget/searched_list_view_order.dart';
import 'package:nahlachicken/feature/delivery/presentation/views/widgets/showdeliverywidget/show_delivery_order_bloc_consumer.dart';

class SearchShowDeliveryOrderBlocBuilder extends StatelessWidget {
  const SearchShowDeliveryOrderBlocBuilder({
    super.key,
    required this.deliveryEntity,
  });

  final DeliveryEntity deliveryEntity;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShowDeliveryOrderCubit, ShowDeliveryOrderState>(
      builder: (context, state) {
        if (state is SearchOrderSucess) {
          return Expanded(
            child: SearchedListViewOrders(
              deliveryEntity: deliveryEntity,
              orders: state.orders,
            ),
          );
        } else if (state is LoadingSearchOrder) {
          return SliverFillRemaining(
            child: Center(
              child: Loading(),
            ),
          );
        } else if (state is EmptySearchOrder) {
          return Expanded(
            child: CustomEmptyWidget(title: "عذرا لا توجد طلبات بهذا الرقم"),
          );
        } else {
          return ShowDeliveryOrderBlocConsumer(deliveryEntity: deliveryEntity);
        }
      },
    );
  }
}
