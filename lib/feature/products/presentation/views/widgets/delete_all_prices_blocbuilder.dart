import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:iconly/iconly.dart';
import 'package:nahlachicken/constant.dart';
import 'package:nahlachicken/core/function/show_delete_all_dialog.dart';
import 'package:nahlachicken/feature/products/domain/entities/add_price_entity.dart';
import 'package:nahlachicken/feature/products/presentation/manager/cubit/add_price_cubit.dart';

class DeleteAllPriceBlocBuider extends StatelessWidget {
  const DeleteAllPriceBlocBuider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var box = Hive.box<AddPriceEntity>(kaddPrice);
    return BlocBuilder<AddPriceCubit, AddPriceState>(
      builder: (context, state) {
        return box.isNotEmpty
            ? IconButton(
                onPressed: () {
                  final cubit = context.read<AddPriceCubit>();
                  buildDialog(
                      textFalse: "إلغاء",
                      context: context,
                      title: "هل أنت متأكد أنك تريد حذف جميع المنتجات؟",
                      onTapTrue: () {
                        cubit.deleteAllPrice();
                        Navigator.pop(context);
                      },
                      textTrue: "نعم، احذف",
                      onTapFalse: () {
                        Navigator.pop(context);
                      });
                },
                icon: Icon(
                  IconlyLight.delete,
                  color: kAccentColorDark,
                ),
              )
            : SizedBox();
      },
    );
  }
}
