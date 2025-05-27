import 'package:flutter/material.dart';

import 'package:nahlachicken/feature/orders/presentation/views/widgets/custom_copy_text.dart';

class CustomPhoneWidget extends StatelessWidget {
  const CustomPhoneWidget({
    super.key,
    this.phoneNumber,
  });

  final String? phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.phone, size: 16, color: Colors.green),
        SizedBox(width: 4),
        Expanded(
            child: CustomCopyText(
                textCopied: phoneNumber!, showText: "تم نسخ الرقم"))
      ],
    );
  }
}
