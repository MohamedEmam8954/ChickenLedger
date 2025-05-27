import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nahlachicken/constant.dart';
import 'package:nahlachicken/core/utils/app_styles.dart';
import 'package:nahlachicken/feature/orders/presentation/manager/addorder/add_order_cubit.dart';
import 'package:nahlachicken/feature/orders/presentation/views/widgets/balance_wallet_body.dart';

class BalenceWalletView extends StatelessWidget {
  const BalenceWalletView({super.key, required this.addOrderCubit});
  final AddOrderCubit addOrderCubit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: addOrderCubit,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            "مبيعات اليوم",
            style: AppStyles.style18Bold,
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: kAccentColorDark,
            ),
          ),
        ),
        body: const BalenceWalletBody(),
      ),
    );
  }
}
