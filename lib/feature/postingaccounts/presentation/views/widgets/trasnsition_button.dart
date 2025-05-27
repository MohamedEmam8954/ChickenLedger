import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:nahlachicken/constant.dart';
import 'package:nahlachicken/core/function/navgaition.dart';
import 'package:nahlachicken/core/utils/app_router.dart';
import 'package:nahlachicken/feature/postingaccounts/presentation/manager/clientAmountCubit/cubit/client_amount_cubit.dart';

class TranstitionButton extends StatelessWidget {
  const TranstitionButton({super.key, required this.clientId});

  final String clientId;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Map<String, dynamic> extra = {
          "clientId": clientId,
          "clientAmountCubit": context.read<ClientAmountCubit>()
        };
        navToWithBack(context, AppRouter.clientPaymentView, extra: extra);
      },
      icon: Icon(
        IconlyLight.chart,
        color: kAccentColorDark,
      ),
    );
  }
}
