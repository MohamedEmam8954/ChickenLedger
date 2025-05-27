import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nahlachicken/constant.dart';
import 'package:nahlachicken/core/function/navgaition.dart';
import 'package:nahlachicken/core/utils/app_router.dart';
import 'package:nahlachicken/core/utils/app_styles.dart';
import 'package:nahlachicken/feature/delivery/domain/entities/deliveryentity/delivery_entity.dart';
import 'package:nahlachicken/feature/delivery/presentation/manager/cubit/delivery_cubit.dart';

class ShowOrderButton extends StatelessWidget {
  const ShowOrderButton({
    super.key,
    required this.deliveryEntity,
  });

  final DeliveryEntity deliveryEntity;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        Map<String, dynamic> extra = {
          "deliveryCubit": context.read<DeliveryCubit>(),
          "deliveryEntity": deliveryEntity,
        };
        navToWithBack(context, AppRouter.showDeliveryOrder, extra: extra);
      },
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          "عرض الأوردرات",
          style: AppStyles.style14Bold.copyWith(color: kAccentColorDark),
        ),
      ),
    );
  }
}
