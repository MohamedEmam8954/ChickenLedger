import 'package:flutter/material.dart';
import 'package:nahlachicken/core/utils/app_styles.dart';

class DeliveryInfo extends StatelessWidget {
  const DeliveryInfo(
      {super.key, required this.icon, required this.text, this.color});
  final IconData icon;
  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: color ?? Colors.white70, size: 18),
        const SizedBox(width: 6),
        Text(
          text,
          style: AppStyles.style14Regular.copyWith(color: Colors.white),
        ),
      ],
    );
  }
}
