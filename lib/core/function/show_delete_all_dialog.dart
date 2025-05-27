import 'package:flutter/material.dart';
import 'package:nahlachicken/constant.dart';
import 'package:nahlachicken/core/utils/app_styles.dart';

void buildDialog({
  required BuildContext context,
  required String title,
  required VoidCallback onTapTrue,
  required String textTrue,
  required String textFalse,
  required VoidCallback onTapFalse,
  Color? textFalseColor,
  bool barrierDismissible = true,
}) {
  showDialog(
    barrierDismissible: barrierDismissible,
    useSafeArea: true,
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: kSecondaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        content: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            title,
            style: AppStyles.style16Bold.copyWith(color: Colors.white70),
            textAlign: TextAlign.center,
          ),
        ),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          TextButton(
            onPressed: onTapTrue,
            child: Text(
              textTrue,
              style: AppStyles.style14Bold.copyWith(
                color: kAccentColorLight,
              ),
            ),
          ),
          TextButton(
            onPressed: onTapFalse,
            child: Text(
              textFalse,
              style: AppStyles.style14Bold.copyWith(
                color: textFalseColor ?? Colors.grey.shade400,
              ),
            ),
          ),
        ],
      );
    },
  );
}
