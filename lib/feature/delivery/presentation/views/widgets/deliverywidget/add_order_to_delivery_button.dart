import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nahlachicken/constant.dart';
import 'package:nahlachicken/core/function/navgaition.dart';
import 'package:nahlachicken/core/utils/app_router.dart';
import 'package:nahlachicken/core/utils/app_styles.dart';
import 'package:nahlachicken/feature/delivery/domain/entities/deliveryentity/delivery_entity.dart';
import 'package:nahlachicken/feature/delivery/presentation/manager/cubit/delivery_cubit.dart';
import 'package:nahlachicken/feature/delivery/presentation/manager/deliveryOrder/cubit/delivery_order_cubit.dart';

class AddOrderToDeliveryButton extends StatelessWidget {
  const AddOrderToDeliveryButton({
    super.key,
    required this.deliveryEntity,
  });

  final DeliveryEntity deliveryEntity;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        Map<String, dynamic> extra = {
          "deliveryOrderCubit": context.read<DeliveryOrderCubit>(),
          "deliveryCubit": context.read<DeliveryCubit>(),
          "DeliveryId": deliveryEntity.deliveryid,
          "deliveryName": deliveryEntity.name,
        };
        navToWithBack(context, AppRouter.deliveryOrdersView, extra: extra);
      },
      icon: Icon(
        Icons.add,
        color: Colors.black,
      ),
      label: Text(
        "اضافه أوردر",
        style: AppStyles.style14Bold.copyWith(color: Colors.black),
      ),
      style: ElevatedButton.styleFrom(
          backgroundColor: kAccentColorLight.withValues(alpha: 0.9)),
    );
  }
}
