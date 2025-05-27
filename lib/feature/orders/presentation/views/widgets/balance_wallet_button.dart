import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nahlachicken/constant.dart';
import 'package:nahlachicken/core/function/navgaition.dart';
import 'package:nahlachicken/core/utils/app_router.dart';
import 'package:nahlachicken/feature/orders/presentation/manager/addorder/add_order_cubit.dart';

class BalenceWalletButton extends StatelessWidget {
  const BalenceWalletButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        navToWithBack(context, AppRouter.balanceWallet,
            extra: context.read<AddOrderCubit>());
      },
      icon: Icon(
        Icons.account_balance_wallet,
        color: kAccentColorDark,
      ),
    );
  }
}
