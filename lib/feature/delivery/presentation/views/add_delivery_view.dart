import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nahlachicken/constant.dart';
import 'package:nahlachicken/core/function/navgaition.dart';
import 'package:nahlachicken/core/utils/app_styles.dart';
import 'package:nahlachicken/feature/delivery/presentation/manager/cubit/delivery_cubit.dart';
import 'package:nahlachicken/feature/delivery/presentation/views/widgets/add_delivery/add_delivery_body.dart';

class AddDeliveryView extends StatelessWidget {
  const AddDeliveryView({super.key, required this.deliveryCubit});
  final DeliveryCubit deliveryCubit;
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: deliveryCubit,
      child: PopScope(
        onPopInvokedWithResult: (didPop, result) {
          if (didPop) {
            deliveryCubit.getDelivery(deliveryCubit.getFilter());
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
              "اضافه مندوب",
              style: AppStyles.style18Bold,
            ),
            centerTitle: true,
          ),
          body: AddDeliveryViewBody(),
        ),
      ),
    );
  }
}
