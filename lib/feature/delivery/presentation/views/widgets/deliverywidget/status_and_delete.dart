import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:nahlachicken/constant.dart';
import 'package:nahlachicken/core/function/show_tostification.dart';
import 'package:nahlachicken/feature/delivery/domain/entities/deliveryentity/delivery_entity.dart';
import 'package:nahlachicken/feature/delivery/presentation/manager/cubit/delivery_cubit.dart';
import 'package:nahlachicken/feature/delivery/presentation/views/widgets/deliverywidget/delivery_status.dart';

class DeleteAndStatus extends StatelessWidget {
  const DeleteAndStatus({
    super.key,
    required this.deliveryEntity,
  });

  final DeliveryEntity deliveryEntity;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        DeliveryStatus(
          deliveryId: deliveryEntity.deliveryid,
          status: deliveryEntity.deliveryStatus,
        ),
        const SizedBox(width: 10),
        IconButton(
          onPressed: () {
            context.read<DeliveryCubit>().deleteDelivery(
                deliveryId: deliveryEntity.deliveryid,
                orders: deliveryEntity.orders);
            showTostification(
                context, "تم حذف المندوب بنجاح", Colors.green, Icons.check);
          },
          icon: Icon(
            IconlyLight.delete,
            color: kAccentColorLight,
          ),
        )
      ],
    );
  }
}
