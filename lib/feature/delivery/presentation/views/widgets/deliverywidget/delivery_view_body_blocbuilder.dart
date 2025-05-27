import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nahlachicken/core/widgets/custom_empty_widget.dart';
import 'package:nahlachicken/feature/delivery/presentation/manager/cubit/delivery_cubit.dart';
import 'package:nahlachicken/feature/delivery/presentation/views/widgets/deliverywidget/search_and_delivery_list.dart';

class DeliveryViewBodyBlocBuilder extends StatelessWidget {
  const DeliveryViewBodyBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DeliveryCubit, DeliveryState>(
      builder: (context, state) {
        if (state is GetDeliveryEmpty) {
          return CustomEmptyWidget(title: state.message);
        }
        return SearchAndDeliveryList();
      },
    );
  }
}
