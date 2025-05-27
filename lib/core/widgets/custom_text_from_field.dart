import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nahlachicken/constant.dart';
import 'package:nahlachicken/core/utils/app_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      this.validator,
      this.textInputType,
      this.onChanged,
      this.onFieldSubmitted,
      this.hintText,
      this.focusNode,
      this.controller,
      this.inputFormatters,
      this.suffixIcon,
      this.prefixIcon,
      this.maxLines = 1});

  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final TextInputType? textInputType;
  final String? hintText;

  final FocusNode? focusNode;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final IconData? suffixIcon;
  final Widget? prefixIcon;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      inputFormatters: inputFormatters,
      cursorColor: kAccentColorLight,
      style: AppStyles.style16Bold.copyWith(color: Colors.black),
      controller: controller,
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      focusNode: focusNode,
      validator: validator,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      keyboardType: textInputType,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: Icon(
          suffixIcon,
          size: 25,
          color: kAccentColorDark,
        ),
        errorStyle:
            AppStyles.style12Regular.copyWith(color: Colors.red, height: 0.8),
        filled: true,
        fillColor: Colors.white,
        hintText: hintText,
        hintStyle: AppStyles.style16Bold.copyWith(color: Colors.black),
        border: outlineInputBorder(),
        enabledBorder: outlineInputBorder(),
        focusedBorder: outlineInputBorder(),
      ),
    );
  }

  OutlineInputBorder outlineInputBorder() {
    return const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(
        color: Colors.orange,
        width: 1,
      ),
    );
  }
}
