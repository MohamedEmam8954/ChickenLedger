import 'package:flutter/material.dart';
import 'package:nahlachicken/core/utils/app_styles.dart';
import 'package:nahlachicken/feature/postingaccounts/presentation/views/widgets/client_price.dart';

class TotalPrice extends StatelessWidget {
  const TotalPrice({super.key, required this.totalPrice});

  final num totalPrice;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        spacing: 10,
        children: [
          Text(
            "الإجمالي الحالي:",
            style: AppStyles.style18Bold.copyWith(
              color: Colors.white,
              fontSize: 18,
              letterSpacing: 1.2,
            ),
          ),
          ClientPrice(price: totalPrice),
        ],
      ),
    );
  }
}
