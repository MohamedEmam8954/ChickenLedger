import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:nahlachicken/constant.dart';
import 'package:nahlachicken/core/function/navgaition.dart';
import 'package:nahlachicken/core/utils/app_router.dart';
import 'package:nahlachicken/feature/delivery/presentation/manager/deliveryOrder/cubit/delivery_order_cubit.dart';

class DeliveryOrderFilterButton extends StatelessWidget {
  const DeliveryOrderFilterButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        navToWithBack(context, AppRouter.deliveryOrderFilterView,
            extra: context.read<DeliveryOrderCubit>());
      },
      icon: Icon(
        IconlyLight.filter,
        color: kAccentColorDark,
      ),
    );
  }
}
