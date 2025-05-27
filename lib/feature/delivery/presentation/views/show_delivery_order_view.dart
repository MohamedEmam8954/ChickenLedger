import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nahlachicken/constant.dart';
import 'package:nahlachicken/core/function/navgaition.dart';
import 'package:nahlachicken/core/utils/app_styles.dart';
import 'package:nahlachicken/core/utils/dependency_injection.dart';
import 'package:nahlachicken/feature/delivery/data/repo/delivery_repo_imp.dart';
import 'package:nahlachicken/feature/delivery/domain/entities/deliveryentity/delivery_entity.dart';
import 'package:nahlachicken/feature/delivery/presentation/manager/cubit/delivery_cubit.dart';
import 'package:nahlachicken/feature/delivery/presentation/manager/showdeliveryorder/cubit/show_delivery_order_cubit.dart';
import 'package:nahlachicken/feature/delivery/presentation/views/widgets/showdeliverywidget/delete_delivery_orders.dart';
import 'package:nahlachicken/feature/delivery/presentation/views/widgets/showdeliverywidget/show_delivery_order_body.dart';

class ShowDeliveryOrderView extends StatelessWidget {
  const ShowDeliveryOrderView(
      {super.key, required this.deliveryEntity, required this.deliveryCubit});

  final DeliveryEntity deliveryEntity;
  final DeliveryCubit deliveryCubit;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              ShowDeliveryOrderCubit(getIt.get<DeliveryRepoImp>())
                ..getdelivery(deliveryEntity.deliveryid),
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
              DeleteDeliveryOrders(
                deliveryName: deliveryEntity.name,
                orders: deliveryEntity.orders,
                deliveryId: deliveryEntity.deliveryid,
              )
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
              "اوردرات ${deliveryEntity.name}",
              style: AppStyles.style18Bold,
            ),
            centerTitle: true,
          ),
          body: ShowDeliveryOrderBody(
            deliveryEntity: deliveryEntity,
          ),
        ),
      ),
    );
  }
}
