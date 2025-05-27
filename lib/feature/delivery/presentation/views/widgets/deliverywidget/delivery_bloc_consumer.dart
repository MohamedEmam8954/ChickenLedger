import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nahlachicken/core/function/show_tostification.dart';
import 'package:nahlachicken/core/widgets/custom_loading.dart';
import 'package:nahlachicken/feature/delivery/presentation/manager/cubit/delivery_cubit.dart';
import 'package:nahlachicken/feature/delivery/presentation/views/widgets/deliverywidget/delivery_listview.dart';

class DeliveryBlocConsumer extends StatelessWidget {
  const DeliveryBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DeliveryCubit, DeliveryState>(
      listener: (context, state) {
        if (state is GetDeliveryFailure) {
          showTostification(
              context, state.errorMessage, Colors.red, Icons.error_outline);
        }
      },
      builder: (context, state) {
        if (state is GetDeliverySucess) {
          return DeliveryListView(
            deliveryList: state.deliveryList,
          );
        } else {
          return SliverFillRemaining(
            child: Center(
              child: Loading(),
            ),
          );
        }
      },
    );
  }
}
