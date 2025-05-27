import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:nahlachicken/constant.dart';
import 'package:nahlachicken/core/function/show_delete_all_dialog.dart';
import 'package:nahlachicken/feature/delivery/presentation/manager/cubit/delivery_cubit.dart';

class DeleteAllDeliveriesButton extends StatelessWidget {
  const DeleteAllDeliveriesButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        var cubit = context.read<DeliveryCubit>();
        buildDialog(
            textFalse: "إلغاء",
            context: context,
            title: "هل أنت متأكد أنك تريد حذف المناديب ؟",
            onTapTrue: () {
              cubit.deleteAllDelivery();
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
  }
}
