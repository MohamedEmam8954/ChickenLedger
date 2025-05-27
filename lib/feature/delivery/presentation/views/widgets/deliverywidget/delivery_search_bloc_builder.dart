import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nahlachicken/core/widgets/custom_empty_widget.dart';
import 'package:nahlachicken/core/widgets/custom_loading.dart';
import 'package:nahlachicken/feature/delivery/presentation/manager/cubit/delivery_cubit.dart';
import 'package:nahlachicken/feature/delivery/presentation/views/widgets/deliverywidget/delivery_bloc_consumer.dart';
import 'package:nahlachicken/feature/delivery/presentation/views/widgets/deliverywidget/delivery_listview.dart';

class DeliverySearchBlocBuilder extends StatelessWidget {
  const DeliverySearchBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DeliveryCubit, DeliveryState>(
      builder: (context, state) {
        if (state is DeliverySearchSucess) {
          return DeliveryListView(
            deliveryList: state.deliveryFilter,
          );
        } else if (state is DeliverySearchLoading) {
          return SliverFillRemaining(
            child: Center(
              child: Loading(),
            ),
          );
        } else if (state is DeliverySearchEmpty) {
          return SliverFillRemaining(
            child: CustomEmptyWidget(
              title: state.errorMessage,
            ),
          );
        }
        return DeliveryBlocConsumer();
      },
    );
  }
}
