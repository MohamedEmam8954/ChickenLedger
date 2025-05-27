import 'package:flutter/material.dart';
import 'package:nahlachicken/core/utils/app_styles.dart';

import 'package:nahlachicken/feature/orders/presentation/views/widgets/custom_copy_text.dart';

class OrderIdAndPhoneNumber extends StatelessWidget {
  const OrderIdAndPhoneNumber(
      {super.key, required this.orderId, required this.phoneNumber});

  final String orderId, phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      textDirection: TextDirection.ltr,
      children: [
        CustomCopyText(
          showText: "تم نسخ رقم الاوردر",
          textCopied: orderId,
        ),
        Text(
          phoneNumber == "" ? "استلام من المحل" : phoneNumber,
          style: AppStyles.style16Bold,
        ),
      ],
    );
  }
}
