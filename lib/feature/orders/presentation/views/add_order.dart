import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nahlachicken/constant.dart';
import 'package:nahlachicken/core/function/navgaition.dart';
import 'package:nahlachicken/core/utils/app_styles.dart';
import 'package:nahlachicken/feature/orders/presentation/manager/addorder/add_order_cubit.dart';
import 'package:nahlachicken/feature/orders/presentation/views/widgets/add_order_body.dart';

class AddOrder extends StatelessWidget {
  const AddOrder({
    super.key,
    required this.addOrderCubit,
  });
  final AddOrderCubit addOrderCubit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: addOrderCubit,
      child: PopScope(
        onPopInvokedWithResult: (didPop, result) {
          if (didPop) {
            addOrderCubit.filterOrder(
              filterType: addOrderCubit.getFilterType(),
            );
          }
        },
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                popFromScreen(context);
              },
              icon: Icon(
                Icons.arrow_back_ios_new,
                color: kAccentColorDark,
              ),
            ),
            backgroundColor: Colors.transparent,
            title: Text(
              "اضافه اوردر",
              style: AppStyles.style18Bold,
            ),
            centerTitle: true,
          ),
          body: AddOrderBody(),
        ),
      ),
    );
  }
}
