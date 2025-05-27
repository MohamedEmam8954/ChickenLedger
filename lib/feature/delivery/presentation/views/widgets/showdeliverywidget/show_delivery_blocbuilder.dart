import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nahlachicken/core/widgets/custom_empty_widget.dart';
import 'package:nahlachicken/feature/delivery/domain/entities/deliveryentity/delivery_entity.dart';
import 'package:nahlachicken/feature/delivery/presentation/manager/showdeliveryorder/cubit/show_delivery_order_cubit.dart';
import 'package:nahlachicken/feature/delivery/presentation/views/widgets/showdeliverywidget/search_and_show_delivery_order_list.dart';

class ShowDeliveryOrderBlocBuilder extends StatelessWidget {
  const ShowDeliveryOrderBlocBuilder({
    super.key,
    required this.deliveryEntity,
  });

  final DeliveryEntity deliveryEntity;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShowDeliveryOrderCubit, ShowDeliveryOrderState>(
      builder: (context, state) {
        if (state is EmptyDeliveryOrder) {
          return CustomEmptyWidget(
              title: "لا توجد اوردرات علي ${deliveryEntity.name} الان");
        } else if (state is UpdateDeliveryOrderSucess) {
          if (state.deliveryEntity.orders.isEmpty) {
            return CustomEmptyWidget(
                title: "لا توجد اوردرات علي ${deliveryEntity.name} الان");
          } else {
            return SearchAndShowDeliveryOrdersList(
                deliveryEntity: state.deliveryEntity);
          }
        } else {
          return SearchAndShowDeliveryOrdersList(
              deliveryEntity: deliveryEntity);
        }
      },
    );
  }
}
