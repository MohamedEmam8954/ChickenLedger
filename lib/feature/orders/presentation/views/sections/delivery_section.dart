import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nahlachicken/core/utils/app_styles.dart';
import 'package:nahlachicken/core/widgets/custom_dropdown_textfield.dart';
import 'package:nahlachicken/core/widgets/custom_text_from_field.dart';

class DeliverySection extends StatelessWidget {
  const DeliverySection(
      {super.key,
      required this.takeAway,
      this.onTakeAwayChanged,
      this.onPhoneNumberChanged,
      required this.phoneNumberController,
      this.onOrderIdChanged,
      required this.orderIdController});
  final String takeAway;
  final Function(String?)? onTakeAwayChanged;
  final Function(String?)? onPhoneNumberChanged;
  final TextEditingController phoneNumberController;

  final Function(String?)? onOrderIdChanged;
  final TextEditingController orderIdController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomDropDownFormField(
          value: takeAway,
          onChanged: onTakeAwayChanged,
          items: [
            DropdownMenuItem(
              value: "دليفري",
              child: Text(
                "دليفري",
                style: AppStyles.style16Bold.copyWith(color: Colors.black),
              ),
            ),
            DropdownMenuItem(
              value: "استلام فوري من المحل",
              child: Text(
                "استلام فوري من المحل",
                style: AppStyles.style16Bold.copyWith(color: Colors.black),
              ),
            ),
            DropdownMenuItem(
              value: "اضافه منتج علي الاوردر",
              child: Text(
                "اضافه منتج علي الاوردر",
                style: AppStyles.style16Bold.copyWith(color: Colors.black),
              ),
            ),
          ],
        ),
        takeAway == "اضافه منتج علي الاوردر"
            ? Column(
                spacing: 15,
                children: [
                  SizedBox(
                    height: 0,
                  ),
                  CustomTextFormField(
                    onChanged: onOrderIdChanged,
                    controller: orderIdController,
                    hintText: "ادخل رقم الاوردر",
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return "الرجاء ادخال رقم الاوردر";
                      }
                      if (!value!.contains("ord#")) {
                        return "الرجاء ادخال رقم اوردر صحيح";
                      }
                      return null;
                    },
                  ),
                ],
              )
            : takeAway == "استلام فوري من المحل"
                ? SizedBox()
                : Column(
                    spacing: 15,
                    children: [
                      SizedBox(
                        height: 0,
                      ),
                      CustomTextFormField(
                        textInputType: TextInputType.number,
                        onChanged: onPhoneNumberChanged,
                        controller: phoneNumberController,
                        hintText: "رقم هاتف الزبون",
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return "الرجاء ادخال رقم الهاتف";
                          }
                          if (value!.length != 11) {
                            return "الرقم يجب أن يكون مكونًا من 11 رقمًا";
                          }
                          if (!RegExp(r'^01[0-9]{9}$').hasMatch(value)) {
                            return "الرجاء إدخال رقم هاتف صحيح يبدأ بـ 01";
                          }
                          return null;
                        },
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(11)
                        ],
                      ),
                    ],
                  ),
      ],
    );
  }
}
