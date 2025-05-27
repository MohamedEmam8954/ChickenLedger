import 'package:flutter/material.dart';
import 'package:nahlachicken/core/utils/app_styles.dart';
import 'package:nahlachicken/core/widgets/custom_dropdown_textfield.dart';

class IsOnSaleSection extends StatelessWidget {
  const IsOnSaleSection({super.key, required this.onSale, this.onSaleChanged});
  final String onSale;
  final Function(String?)? onSaleChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 15,
      children: [
        CustomDropDownFormField(
          value: onSale.isNotEmpty ? onSale : null,
          items: [
            DropdownMenuItem(
              value: "خصم",
              child: Text(
                "خصم",
                style: AppStyles.style16Bold.copyWith(color: Colors.black),
              ),
            ),
            DropdownMenuItem(
              value: "بدون خصم",
              child: Text(
                "بدون خصم",
                style: AppStyles.style16Bold.copyWith(color: Colors.black),
              ),
            ),
          ],
          onChanged: onSaleChanged,
        ),
      ],
    );
  }
}
