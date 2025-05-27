import 'package:flutter/material.dart';
import 'package:nahlachicken/constant.dart';
import 'package:nahlachicken/core/utils/app_styles.dart';

class CustomButtom extends StatelessWidget {
  const CustomButtom(
      {super.key,
      required this.onTap,
      this.isLoading = false,
      required this.title});
  final VoidCallback onTap;
  final bool isLoading;
  final String title;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: kAccentColorLight,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            title,
            style: AppStyles.style16Bold.copyWith(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
