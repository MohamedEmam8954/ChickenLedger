import 'package:flutter/material.dart';
import 'package:nahlachicken/core/utils/app_styles.dart';

class TotalOrderDelivery extends StatelessWidget {
  const TotalOrderDelivery({
    super.key,
    required this.totalPrice,
  });
  final num totalPrice;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.deepOrange.withValues(alpha: 0.8),
            Colors.deepOrangeAccent.withValues(alpha: 0.2)
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "إجمالي الطلبات:",
            style: AppStyles.style18Bold.copyWith(
              color: Colors.white,
              fontSize: 18,
              letterSpacing: 1.2,
            ),
          ),
          Text("$totalPrice ج.م", style: AppStyles.style18Bold),
        ],
      ),
    );
  }
}
