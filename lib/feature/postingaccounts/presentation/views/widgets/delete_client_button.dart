import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:nahlachicken/constant.dart';
import 'package:nahlachicken/core/function/show_delete_all_dialog.dart';
import 'package:nahlachicken/core/function/show_tostification.dart';
import 'package:nahlachicken/feature/postingaccounts/presentation/manager/clientAmountCubit/cubit/client_amount_cubit.dart';

class DeleteClientButton extends StatelessWidget {
  const DeleteClientButton({super.key, required this.clientId});

  final String clientId;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        var cubit = context.read<ClientAmountCubit>();

        buildDialog(
            textFalse: "إلغاء",
            context: context,
            title: "هل أنت متأكد أنك تريد حذف العميل؟",
            onTapTrue: () {
              cubit.deleteClient(clientId);
              showTostification(
                  context, "تم حذف العميل بنجاح", Colors.green, Icons.check);
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
