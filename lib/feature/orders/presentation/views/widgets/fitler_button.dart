import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:iconly/iconly.dart';
import 'package:nahlachicken/constant.dart';
import 'package:nahlachicken/core/function/navgaition.dart';
import 'package:nahlachicken/core/utils/app_router.dart';
import 'package:nahlachicken/feature/orders/presentation/manager/addorder/add_order_cubit.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({super.key});

  @override
  Widget build(BuildContext context) {
    var box = Hive.box<List>(kaddOrder);
    return BlocBuilder<AddOrderCubit, AddOrderState>(
      builder: (context, state) {
        return box.isEmpty
            ? SizedBox()
            : IconButton(
                onPressed: () {
                  navToWithBack(context, AppRouter.filterView,
                      extra: context.read<AddOrderCubit>());
                },
                icon: Icon(
                  IconlyLight.filter,
                  color: kAccentColorDark,
                ),
              );
      },
    );
  }
}
