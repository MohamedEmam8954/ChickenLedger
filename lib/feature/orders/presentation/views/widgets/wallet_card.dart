import 'package:flutter/material.dart';
import 'package:nahlachicken/core/utils/app_styles.dart';

class WalletCard extends StatelessWidget {
  const WalletCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xff1d1f20),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 28),
          const SizedBox(height: 6),
          Text(
            value,
            style: AppStyles.style16Bold.copyWith(color: Colors.white),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: AppStyles.style14Regular.copyWith(color: Colors.white60),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
