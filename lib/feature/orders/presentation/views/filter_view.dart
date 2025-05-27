import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:nahlachicken/constant.dart';
import 'package:nahlachicken/core/utils/app_styles.dart';
import 'package:nahlachicken/feature/orders/presentation/manager/addorder/add_order_cubit.dart';
import 'package:nahlachicken/feature/orders/presentation/views/widgets/filter_view_body.dart';

class FilterView extends StatelessWidget {
  const FilterView({super.key, required this.addOrderCubit});
  final AddOrderCubit addOrderCubit;
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: addOrderCubit,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text("فلترة الطلبات", style: AppStyles.style16Bold),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: kAccentColorDark,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: const FilterViewBody(),
      ),
    );
  }
}
