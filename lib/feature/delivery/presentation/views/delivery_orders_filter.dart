import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nahlachicken/constant.dart';
import 'package:nahlachicken/core/utils/app_styles.dart';
import 'package:nahlachicken/feature/delivery/presentation/manager/deliveryOrder/cubit/delivery_order_cubit.dart';
import 'package:nahlachicken/feature/delivery/presentation/views/widgets/deliveryorderfilter/delivery_filter_view_body.dart';

class DeliveryOrdersFilterView extends StatelessWidget {
  const DeliveryOrdersFilterView({super.key, required this.deliveryOrderCubit});

  final DeliveryOrderCubit deliveryOrderCubit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: deliveryOrderCubit,
      child: Scaffold(
        body: DeliveryOrdersFilterViewBody(),
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
      ),
    );
  }
}
