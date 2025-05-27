import 'package:flutter/material.dart';

import 'package:nahlachicken/constant.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.icon,
    required this.onTap,
    this.padding = 10,
    this.iconSize = 24,
  });
  final IconData icon;
  final VoidCallback onTap;
  final double padding;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(padding),
        decoration: BoxDecoration(
          color: kAccentColorLight.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(
          icon,
          color: kAccentColorLight,
          size: iconSize,
        ),
      ),
    );
  }
}
