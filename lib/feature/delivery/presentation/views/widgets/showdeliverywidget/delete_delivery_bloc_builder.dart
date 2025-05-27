import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nahlachicken/feature/delivery/domain/entities/assignedDeliveryOrder/assigned_delivery_order_entity.dart';
import 'package:nahlachicken/feature/delivery/presentation/manager/showdeliveryorder/cubit/show_delivery_order_cubit.dart';
import 'package:nahlachicken/feature/delivery/presentation/views/widgets/showdeliverywidget/delete_delivery_order_button.dart';

class DeleteDeliveryBlocBuilder extends StatelessWidget {
  const DeleteDeliveryBlocBuilder({
    super.key,
    required this.deliveryName,
    required this.orders,
    required this.deliveryId,
  });

  final String deliveryName;
  final List<AssignedDeliveyOrderEntity> orders;
  final String deliveryId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShowDeliveryOrderCubit, ShowDeliveryOrderState>(
      builder: (context, state) {
        return state is EmptyDeliveryOrder
            ? SizedBox()
            : DeleteDeliveryOrdersButton(
                deliveryName: deliveryName,
                orders: orders,
                deliveryId: deliveryId);
      },
    );
  }
}
