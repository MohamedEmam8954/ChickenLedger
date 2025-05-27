import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nahlachicken/feature/delivery/presentation/manager/cubit/delivery_cubit.dart';
import 'package:nahlachicken/feature/delivery/presentation/views/widgets/deliverywidget/delete_all_deliveries_button.dart';

class DeleteAllDeliveriesBlocBuilder extends StatelessWidget {
  const DeleteAllDeliveriesBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DeliveryCubit, DeliveryState>(
      builder: (context, state) {
        return state is GetDeliveryEmpty
            ? SizedBox()
            : DeleteAllDeliveriesButton();
      },
    );
  }
}
