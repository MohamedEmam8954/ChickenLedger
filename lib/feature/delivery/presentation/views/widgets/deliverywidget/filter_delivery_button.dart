import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:nahlachicken/constant.dart';
import 'package:nahlachicken/core/function/navgaition.dart';
import 'package:nahlachicken/core/utils/app_router.dart';
import 'package:nahlachicken/feature/delivery/presentation/manager/cubit/delivery_cubit.dart';

class FilterDeliveryButton extends StatelessWidget {
  const FilterDeliveryButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        navToWithBack(context, AppRouter.deliveryFilterView,
            extra: context.read<DeliveryCubit>());
      },
      icon: Icon(
        IconlyLight.filter,
        color: kAccentColorDark,
      ),
    );
  }
}
