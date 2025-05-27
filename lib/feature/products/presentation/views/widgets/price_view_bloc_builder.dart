import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nahlachicken/core/widgets/custom_loading.dart';
import 'package:nahlachicken/feature/products/presentation/manager/cubit/add_price_cubit.dart';
import 'package:nahlachicken/core/widgets/custom_empty_widget.dart';
import 'package:nahlachicken/feature/products/presentation/views/widgets/show_prices.dart';

class PriceViewBlocbuilder extends StatelessWidget {
  const PriceViewBlocbuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddPriceCubit, AddPriceState>(
      builder: (context, state) {
        if (state is GetPriceloading) {
          return CustomLoading();
        } else if (state is GetPriceSucess) {
          return ShowPrices(
            getPrice: state.getPriceEntity,
          );
        }
        return CustomEmptyWidget(title: "لا توجد اسعار مسجله");
      },
    );
  }
}
