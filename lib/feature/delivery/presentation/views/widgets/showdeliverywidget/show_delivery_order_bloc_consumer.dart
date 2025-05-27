import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nahlachicken/core/function/show_tostification.dart';
import 'package:nahlachicken/feature/delivery/domain/entities/deliveryentity/delivery_entity.dart';
import 'package:nahlachicken/feature/delivery/presentation/manager/showdeliveryorder/cubit/show_delivery_order_cubit.dart';
import 'package:nahlachicken/feature/delivery/presentation/views/widgets/showdeliverywidget/show_delivery_order_listview.dart';

class ShowDeliveryOrderBlocConsumer extends StatelessWidget {
  const ShowDeliveryOrderBlocConsumer({
    super.key,
    required this.deliveryEntity,
  });

  final DeliveryEntity deliveryEntity;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShowDeliveryOrderCubit, ShowDeliveryOrderState>(
      listener: (context, state) {
        if (state is DeleteDeliveryOrderFailure) {
          showTostification(
              context, state.errorMessage, Colors.red, Icons.close);
        }
      },
      builder: (context, state) {
        if (state is UpdateDeliveryOrderSucess) {
          return Expanded(
            child: ShowDeliveryOrdersListView(
                deliveryEntity: state.deliveryEntity),
          );
        } else {
          return Expanded(
            child: ShowDeliveryOrdersListView(deliveryEntity: deliveryEntity),
          );
        }
      },
    );
  }
}
