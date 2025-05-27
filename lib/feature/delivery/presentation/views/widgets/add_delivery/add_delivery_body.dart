import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nahlachicken/core/function/show_tostification.dart';
import 'package:nahlachicken/core/widgets/custom_bottom.dart';
import 'package:nahlachicken/core/widgets/custom_loading.dart';
import 'package:nahlachicken/core/widgets/custom_text_from_field.dart';
import 'package:nahlachicken/feature/delivery/presentation/manager/cubit/delivery_cubit.dart';

class AddDeliveryViewBody extends StatefulWidget {
  const AddDeliveryViewBody({super.key});

  @override
  State<AddDeliveryViewBody> createState() => _AddDeliveryViewBodyState();
}

class _AddDeliveryViewBodyState extends State<AddDeliveryViewBody> {
  var globalKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  TextEditingController? phoneController = TextEditingController();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  void dispose() {
    nameController.dispose();
    phoneController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Form(
        autovalidateMode: autovalidateMode,
        key: globalKey,
        child: Column(
          spacing: 15,
          children: [
            const SizedBox(
              height: 5,
            ),
            CustomTextFormField(
              controller: nameController,
              hintText: "اسم المندوب",
              validator: (value) {
                if (value!.isEmpty) {
                  return "ادخل اسم المندوب";
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
              hintText: "رقم المندوب (اختياري)",
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
            BlocConsumer<DeliveryCubit, DeliveryState>(
              listener: (context, state) {
                if (state is AddDeliverySucess) {
                  showTostification(context, "تم اضافه المندوب بنجاح",
                      Colors.green, Icons.check_circle_outline);
                } else if (state is AddDeliveryFailure) {
                  showTostification(context, state.errorMessage, Colors.red,
                      Icons.error_outline);
                }
              },
              builder: (context, state) {
                return state is AddDeliveryLoading
                    ? Loading(
                        size: 25,
                      )
                    : CustomButtom(
                        onTap: () {
                          if (globalKey.currentState!.validate()) {
                            context.read<DeliveryCubit>().addDelivery(
                                  name: nameController.text,
                                  phoneNumber: phoneController?.text,
                                );
                            phoneController?.clear();
                            nameController.clear();
                            setState(() {});
                          } else {
                            autovalidateMode = AutovalidateMode.always;
                            setState(() {});
                          }
                        },
                        title: "اضافه مندوب",
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}
