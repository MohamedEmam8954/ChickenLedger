import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nahlachicken/constant.dart';
import 'package:nahlachicken/core/function/navgaition.dart';
import 'package:nahlachicken/core/utils/app_router.dart';
import 'package:nahlachicken/core/utils/app_styles.dart';
import 'package:nahlachicken/feature/products/presentation/manager/cubit/add_price_cubit.dart';
import 'package:nahlachicken/feature/products/presentation/views/widgets/delete_all_prices_blocbuilder.dart';
import 'package:nahlachicken/feature/products/presentation/views/widgets/price_view_bloc_builder.dart';

class PriceView extends StatelessWidget {
  const PriceView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        heroTag: "addprice",
        onPressed: () {
          navToWithBack(context, AppRouter.addPrice,
              extra: context.read<AddPriceCubit>());
        },
        backgroundColor: kAccentColorLight,
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "قائمة الأسعار",
          style: AppStyles.style18Bold,
        ),
        centerTitle: true,
        actions: [
          DeleteAllPriceBlocBuider(),
        ],
      ),
      body: PriceViewBlocbuilder(),
    );
  }
}
