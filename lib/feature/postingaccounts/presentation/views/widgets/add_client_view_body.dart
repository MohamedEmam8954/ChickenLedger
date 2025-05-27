import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nahlachicken/core/function/show_tostification.dart';
import 'package:nahlachicken/core/widgets/custom_bottom.dart';
import 'package:nahlachicken/core/widgets/custom_loading.dart';
import 'package:nahlachicken/core/widgets/custom_text_from_field.dart';
import 'package:nahlachicken/feature/postingaccounts/data/models/client_account_model.dart';
import 'package:nahlachicken/feature/postingaccounts/presentation/manager/clientAmountCubit/cubit/client_amount_cubit.dart';
import 'package:uuid/uuid.dart';

class AddClientViewBody extends StatefulWidget {
  const AddClientViewBody({super.key});

  @override
  State<AddClientViewBody> createState() => _AddClientViewBodyState();
}

class _AddClientViewBodyState extends State<AddClientViewBody> {
  TextEditingController? phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController notesController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  String accountPosting = "accountingPosting";

  var globalKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  void dispose() {
    phoneController?.dispose();
    nameController.dispose();
    priceController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Form(
        key: globalKey,
        autovalidateMode: autovalidateMode,
        child: Column(
          spacing: 15,
          children: [
            SizedBox(
              height: 5,
            ),
            CustomTextFormField(
              controller: nameController,
              hintText: "اسم العميل",
              validator: (value) {
                if (value!.isEmpty) {
                  return "ادخل اسم العميل";
                }
                return null;
              },
            ),
            CustomTextFormField(
              textInputType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(11),
              ],
              controller: phoneController,
              hintText: "رقم العميل (اختياري)",
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return null;
                }
                if (value!.length != 11) {
                  return "الرقم يجب أن يكون مكونًا من 11 رقمًا";
                }
                if (!RegExp(r'^01[0-9]{9}$').hasMatch(value)) {
                  return "الرجاء إدخال رقم هاتف صحيح يبدأ بـ 01";
                }
                return null;
              },
            ),
            CustomTextFormField(
              inputFormatters: [LengthLimitingTextInputFormatter(11)],
              controller: priceController,
              hintText: "ادخل المبلغ",
              onChanged: (value) {},
              onFieldSubmitted: (value) {},
              textInputType: TextInputType.number,
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return "الرجاء إدخال المبلغ";
                }
                return null;
              },
            ),
            BlocConsumer<ClientAmountCubit, ClientAmountState>(
              listener: (context, state) {
                if (state is AddClientFailure) {
                  showTostification(context, state.errorMessage, Colors.red,
                      Icons.error_outline);
                }
                if (state is AddClientSucess) {
                  showTostification(context, "تمت اضافه العميل بنجاح",
                      Colors.green, Icons.check_circle_outline);
                }
              },
              builder: (context, state) {
                return state is AddClientLoading
                    ? Loading(
                        size: 25,
                      )
                    : CustomButtom(
                        onTap: () async {
                          if (globalKey.currentState!.validate()) {
                            await context.read<ClientAmountCubit>().addClient(
                                  clientAccountModel: ClientAmountModel(
                                    phoneNumber: phoneController?.text,
                                    name: nameController.text,
                                    totalPrice: num.parse(priceController.text),
                                    clientId: Uuid().v4(),
                                    dateTime: DateTime.now(),
                                  ),
                                );
                            nameController.clear();
                            priceController.clear();
                            phoneController?.clear();
                            setState(() {});
                          } else {
                            autovalidateMode = AutovalidateMode.always;
                            setState(() {});
                          }
                        },
                        title: "ادخل العميل");
              },
            ),
          ],
        ),
      ),
    );
  }
}
