import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:nahlachicken/core/function/show_tostification.dart';
import 'package:nahlachicken/core/widgets/custom_bottom.dart';
import 'package:nahlachicken/core/widgets/custom_text_from_field.dart';
import 'package:nahlachicken/feature/postingaccounts/presentation/manager/clientAmountCubit/cubit/client_amount_cubit.dart';

class AddAmountToClient extends StatefulWidget {
  const AddAmountToClient(
      {super.key, required this.clientId, required this.name});

  final String clientId;
  final String name;

  @override
  State<AddAmountToClient> createState() => _AddAmountToClientState();
}

class _AddAmountToClientState extends State<AddAmountToClient> {
  final TextEditingController addController = TextEditingController();
  var globalKey = GlobalKey<FormState>();
  AutovalidateMode autovaildateMode = AutovalidateMode.disabled;

  @override
  void dispose() {
    addController.dispose();
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
            hintText: "أدخل مبلغ الإضافة",
            textInputType: TextInputType.number,
            controller: addController,
            suffixIcon: IconlyLight.wallet,
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return "من فضلك ادخل مبلغ الاضافه";
              }
              return null;
            },
          ),
          SizedBox(
            height: 15,
          ),
          CustomButtom(
              onTap: () {
                if (globalKey.currentState!.validate()) {
                  addAmountLogic(context);
                  addPayments(context);
                } else {
                  autovaildateMode = AutovalidateMode.always;
                  setState(() {});
                }
              },
              title: "اضافه مبلغ"),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }

  void addPayments(BuildContext context) {
    final amount = num.parse(addController.text.trim());
    context.read<ClientAmountCubit>().addClientsPayments(
        clientId: widget.clientId,
        name: widget.name,
        totalPrice: amount,
        isAdded: true);
    addController.clear();
  }

  void addAmountLogic(BuildContext context) {
    context
        .read<ClientAmountCubit>()
        .addClientAmount(widget.clientId, num.parse(addController.text));
    showTostification(
        context,
        "تم اضافه ${addController.text} ج بنجاح علي ${widget.name}",
        Colors.green,
        Icons.check_circle_outline);
  }
}
