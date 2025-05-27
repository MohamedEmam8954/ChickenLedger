import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:nahlachicken/constant.dart';
import 'package:nahlachicken/core/function/navgaition.dart';
import 'package:nahlachicken/core/utils/app_router.dart';
import 'package:nahlachicken/core/utils/app_styles.dart';
import 'package:nahlachicken/feature/delivery/presentation/manager/cubit/delivery_cubit.dart';
import 'package:nahlachicken/feature/delivery/presentation/views/widgets/deliverywidget/delete_all_deliveries.dart';
import 'package:nahlachicken/feature/delivery/presentation/views/widgets/deliverywidget/delivery_view_body.dart';
import 'package:nahlachicken/feature/delivery/presentation/views/widgets/deliverywidget/filter_delivery_button.dart';

class DeliveryView extends StatelessWidget {
  const DeliveryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DeliveryViewBody(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "قائمه المندوبين",
          style: AppStyles.style18Bold,
        ),
        centerTitle: true,
        actions: [
          FilterDeliveryButton(),
          DeleteAllDeliveries(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          navToWithBack(context, AppRouter.addeliveryView,
              extra: context.read<DeliveryCubit>());
        },
        backgroundColor: kAccentColorLight,
        child: const Icon(
          IconlyLight.add_user,
          color: Colors.black,
        ),
      ),
    );
  }
}
