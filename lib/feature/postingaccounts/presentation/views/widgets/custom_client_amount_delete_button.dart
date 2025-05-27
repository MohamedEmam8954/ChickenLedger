import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:nahlachicken/constant.dart';
import 'package:nahlachicken/core/function/show_delete_all_dialog.dart';
import 'package:nahlachicken/feature/postingaccounts/presentation/manager/clientAmountCubit/cubit/client_amount_cubit.dart';

class CustomClientAmountDeleteButton extends StatelessWidget {
  const CustomClientAmountDeleteButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<ClientAmountCubit, ClientAmountState, bool>(
      selector: (state) {
        return state is ClientAmountEmpty;
      },
      builder: (context, isEmpty) {
        return isEmpty
            ? SizedBox()
            : IconButton(
                onPressed: () {
                  var cubit = context.read<ClientAmountCubit>();
                  showDialog(context, cubit);
                },
                icon: Icon(
                  IconlyLight.delete,
                  color: kAccentColorDark,
                ));
      },
    );
  }

  void showDialog(BuildContext context, ClientAmountCubit cubit) {
    buildDialog(
        textFalse: "إلغاء",
        context: context,
        title: "هل أنت متأكد أنك تريد حذف جميع العملاء؟",
        onTapTrue: () {
          cubit.deleteAllClient();
          Navigator.pop(context);
        },
        textTrue: "نعم، احذف",
        onTapFalse: () {
          Navigator.pop(context);
        });
  }
}
