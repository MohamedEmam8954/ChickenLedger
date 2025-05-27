import 'package:flutter/material.dart';
import 'package:nahlachicken/feature/delivery/domain/entities/assignedDeliveryOrder/assigned_delivery_order_entity.dart';
import 'package:nahlachicken/feature/delivery/presentation/views/widgets/showdeliverywidget/delete_delivery_bloc_builder.dart';

class DeleteDeliveryOrders extends StatelessWidget {
  const DeleteDeliveryOrders(
      {super.key,
      required this.deliveryId,
      required this.orders,
      required this.deliveryName});
  final String deliveryId;
  final List<AssignedDeliveyOrderEntity> orders;
  final String deliveryName;

  @override
  Widget build(BuildContext context) {
    return DeleteDeliveryBlocBuilder(
        deliveryName: deliveryName, orders: orders, deliveryId: deliveryId);
  }
}
