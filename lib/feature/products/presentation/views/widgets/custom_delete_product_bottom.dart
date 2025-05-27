import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nahlachicken/constant.dart';
import 'package:nahlachicken/core/function/show_tostification.dart';
import 'package:nahlachicken/core/utils/app_styles.dart';
import 'package:nahlachicken/feature/products/presentation/manager/cubit/add_price_cubit.dart';

class CustomDeleteProductBottom extends StatelessWidget {
  const CustomDeleteProductBottom({super.key, required this.productId});

  final String productId;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(12),
        bottomRight: Radius.circular(12),
      ),
      onTap: () {
        context.read<AddPriceCubit>().deleteProduct(
              id: productId,
            );
        showTostification(
            context, "تم حذف المنتج بنجاح", Colors.green, Icons.check);
      },
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.08),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(12),
            bottomRight: Radius.circular(12),
          ),
        ),
        child: Text(
          "حذف المنتج",
          style: AppStyles.style14Bold.copyWith(color: kAccentColorDark),
        ),
      ),
    );
  }
}
