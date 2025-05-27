import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:nahlachicken/core/function/show_tostification.dart';
import 'package:nahlachicken/core/widgets/custom_bottom.dart';
import 'package:nahlachicken/core/widgets/custom_text_from_field.dart';
import 'package:nahlachicken/feature/postingaccounts/presentation/manager/clientAmountCubit/cubit/client_amount_cubit.dart';

class DropAmountFromClient extends StatefulWidget {
  const DropAmountFromClient(
      {super.key,
      required this.clientId,
      required this.name,
      required this.totalPrice});

  final String clientId;
  final String name;
  final num totalPrice;

  @override
  State<DropAmountFromClient> createState() => _DropAmountFromClientState();
}

class _DropAmountFromClientState extends State<DropAmountFromClient> {
  final dropController = TextEditingController();
  var globalKey = GlobalKey<FormState>();
  AutovalidateMode autovaildateMode = AutovalidateMode.disabled;
  @override
  void dispose() {
    dropController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: globalKey,
      autovalidateMode: autovaildateMode,
      child: Column(
        children: [
          SizedBox(
            height: 15,
          ),
          CustomTextFormField(
            hintText: "أدخل مبلغ التسقيط",
            textInputType: TextInputType.number,
            controller: dropController,
            suffixIcon: IconlyLight.paper_download,
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return "من فضلك ادخل مبلغ التسقيط";
              }
              return null;
            },
          ),
          SizedBox(
            height: 15,
          ),
          CustomButtom(
            onTap: () async {
              if (globalKey.currentState!.validate()) {
                if (num.parse(dropController.text) > widget.totalPrice) {
                  showTostification(
                      context,
                      "مبلغ التسقيط اكبر من الاجمالي الحالي ",
                      Colors.red,
                      Icons.error);
                  return;
                }
                await dropAmountLogic(context);
                await dropClientPayments(context);
              } else {
                autovaildateMode = AutovalidateMode.always;
                setState(() {});
              }
            },
            title: "تسقيط مبلغ",
          ),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }

  Future<void> dropClientPayments(BuildContext context) async {
    await context.read<ClientAmountCubit>().addClientsPayments(
        clientId: widget.clientId,
        name: widget.name,
        totalPrice: num.parse(dropController.text),
        isAdded: false);
    dropController.clear();
  }

  Future<void> dropAmountLogic(BuildContext context) async {
    await context
        .read<ClientAmountCubit>()
        .dropClientAmount(widget.clientId, num.parse(dropController.text));
    showTostification(
        context,
        "تم تسقيط ${dropController.text} ج من علي ${widget.name} بنجاح",
        Colors.green,
        Icons.check_circle_outline);
  }
}
