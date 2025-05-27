import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nahlachicken/constant.dart';
import 'package:nahlachicken/core/function/navgaition.dart';
import 'package:nahlachicken/core/utils/app_styles.dart';
import 'package:nahlachicken/feature/delivery/presentation/manager/cubit/delivery_cubit.dart';
import 'package:nahlachicken/feature/delivery/presentation/manager/deliveryOrder/cubit/delivery_order_cubit.dart';
import 'package:nahlachicken/feature/delivery/presentation/views/widgets/deliveryorder/confirmed_dlivery_button.dart';
import 'package:nahlachicken/feature/delivery/presentation/views/widgets/deliveryorder/delivery_order_body.dart';
import 'package:nahlachicken/feature/delivery/presentation/views/widgets/deliveryorder/delivery_order_filter_button.dart';

class DeliveryOrdersView extends StatelessWidget {
  const DeliveryOrdersView(
      {super.key,
      required this.deliveryOrderCubit,
      required this.deliveryCubit,
      required this.deliveryId,
      required this.deliveryName});

  final DeliveryOrderCubit deliveryOrderCubit;
  final DeliveryCubit deliveryCubit;
  final String deliveryId;
  final String deliveryName;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: deliveryOrderCubit,
        ),
        BlocProvider.value(
          value: deliveryCubit,
        ),
      ],
      child: PopScope(
        onPopInvokedWithResult: (didPop, result) {
          if (didPop) {
            deliveryCubit.getDelivery(deliveryCubit.getFilter());
          }
        },
        child: Scaffold(
          appBar: AppBar(
            actions: [
              ConfirmedDeliveryButton(
                deliveryName: deliveryName,
                deliveryId: deliveryId,
              ),
              DeliveryOrderFilterButton()
            ],
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
              "طلبات التوصيل",
              style: AppStyles.style18Bold,
            ),
            centerTitle: true,
          ),
          body: DeliveryOrdersBody(
            deliveryName: deliveryName,
          ),
        ),
      ),
    );
  }
}
