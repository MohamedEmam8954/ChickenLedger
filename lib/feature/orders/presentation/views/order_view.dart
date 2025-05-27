import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nahlachicken/constant.dart';
import 'package:nahlachicken/core/function/navgaition.dart';
import 'package:nahlachicken/core/utils/app_router.dart';
import 'package:nahlachicken/core/utils/app_styles.dart';
import 'package:nahlachicken/feature/orders/presentation/manager/addorder/add_order_cubit.dart';
import 'package:nahlachicken/feature/orders/presentation/views/widgets/balance_wallet_button.dart';
import 'package:nahlachicken/feature/orders/presentation/views/widgets/delete_all_orders_bloc_builder.dart';
import 'package:nahlachicken/feature/orders/presentation/views/widgets/fitler_button.dart';
import 'package:nahlachicken/feature/orders/presentation/views/widgets/order_view_body.dart';

class OrderView extends StatelessWidget {
  const OrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrderViewBody(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "قائمه الاوردرات",
          style: AppStyles.style18Bold,
        ),
        centerTitle: true,
        actions: [
          DeleteAllOrdersBlocBuider(),
          BalenceWalletButton(),
          FilterButton(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: "addorder",
        onPressed: () {
          navToWithBack(context, AppRouter.addOrder,
              extra: context.read<AddOrderCubit>());
        },
        backgroundColor: kAccentColorLight,
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
    );
  }
}
