import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:nahlachicken/constant.dart';
import 'package:nahlachicken/core/utils/app_styles.dart';

class CustomDropDownFormField extends StatelessWidget {
  const CustomDropDownFormField({
    super.key,
    this.validator,
    this.onChanged,
    this.onFieldSubmitted,
    this.textInputType,
    this.hintText,
    this.focusNode,
    this.items,
    this.value,
  });

  final String? Function(String?)? validator;
  final void Function(String?)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final TextInputType? textInputType;
  final String? hintText;
  final String? value;

  final FocusNode? focusNode;

  final List<DropdownMenuItem<String>>? items;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2<String>(
      value: value,
      decoration: InputDecoration(
        errorStyle:
            AppStyles.style12Regular.copyWith(color: Colors.red, height: 0.6),
        hintText: hintText,
        hintStyle: AppStyles.style16Bold.copyWith(color: Colors.black),
        filled: true,
        fillColor: Colors.white,
        border: cutsomOutlineInputBorder(),
        focusedBorder: cutsomOutlineInputBorder(),
        enabledBorder: cutsomOutlineInputBorder(),
      ),
      items: items,
      onChanged: onChanged,
      validator: validator,
      dropdownStyleData: DropdownStyleData(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          border: Border.all(color: Colors.orange, width: 1),
        ),
        offset: const Offset(0, -5),
      ),
      iconStyleData: const IconStyleData(
        icon: Icon(Icons.keyboard_arrow_down_rounded),
        iconSize: 24,
        iconEnabledColor: kAccentColorLight,
      ),
    );
  }

  OutlineInputBorder cutsomOutlineInputBorder() {
    return const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(
        color: Colors.orange,
        width: 1,
      ),
    );
  }
}
