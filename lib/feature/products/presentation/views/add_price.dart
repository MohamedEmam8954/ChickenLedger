import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nahlachicken/constant.dart';
import 'package:nahlachicken/core/function/navgaition.dart';
import 'package:nahlachicken/core/utils/app_styles.dart';
import 'package:nahlachicken/feature/products/presentation/manager/cubit/add_price_cubit.dart';
import 'package:nahlachicken/feature/products/presentation/views/widgets/add_price_body.dart';

class AddPrices extends StatelessWidget {
  const AddPrices({super.key, required this.addPriceCubit});
  final AddPriceCubit addPriceCubit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: addPriceCubit,
      child: PopScope(
        onPopInvokedWithResult: (didPop, result) {
          if (didPop) {
            addPriceCubit.getPrice();
          }
        },
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
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
              "إضافة سعر",
              style: AppStyles.style18Bold,
            ),
            centerTitle: true,
          ),
          body: AddPriceBody(),
        ),
      ),
    );
  }
}
