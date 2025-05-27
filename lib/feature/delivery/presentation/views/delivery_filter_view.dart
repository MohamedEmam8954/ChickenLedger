import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nahlachicken/constant.dart';
import 'package:nahlachicken/core/utils/app_styles.dart';
import 'package:nahlachicken/feature/delivery/presentation/manager/cubit/delivery_cubit.dart';
import 'package:nahlachicken/feature/delivery/presentation/views/widgets/deliveryfilter/delivery_filter_view_body.dart';

class DeliveryFilterView extends StatelessWidget {
  const DeliveryFilterView({super.key, required this.deliveryCubit});
  final DeliveryCubit deliveryCubit;
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: deliveryCubit,
      child: Scaffold(
        body: DeliveryFilterViewBody(),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text("فلترة حسب الدفع", style: AppStyles.style16Bold),
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
