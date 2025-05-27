import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:iconly/iconly.dart';
import 'package:nahlachicken/constant.dart';
import 'package:nahlachicken/core/function/show_delete_all_dialog.dart';
import 'package:nahlachicken/feature/orders/presentation/manager/addorder/add_order_cubit.dart';

class DeleteAllOrdersBlocBuider extends StatelessWidget {
  const DeleteAllOrdersBlocBuider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var box = Hive.box<List>(kaddOrder);

    return BlocBuilder<AddOrderCubit, AddOrderState>(
      builder: (context, state) {
        return state is DeleteAllOrderSucess || box.isEmpty
            ? SizedBox()
            : IconButton(
                onPressed: () {
                  var cubit = context.read<AddOrderCubit>();
                  buildDialog(
                      textFalse: "إلغاء",
                      context: context,
                      title: "هل أنت متأكد أنك تريد حذف جميع الاوردرات؟",
                      onTapTrue: () {
                        cubit.deleteAllOrders();
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
              );
      },
    );
  }
}
