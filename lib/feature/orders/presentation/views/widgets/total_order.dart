import 'package:flutter/material.dart';

import 'package:nahlachicken/core/utils/app_styles.dart';

class TotalOrder extends StatelessWidget {
  const TotalOrder({
    super.key,
    required this.price,
  });
  final num price;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      textDirection: TextDirection.ltr,
      children: [
        Text(
          ": Total",
          style: AppStyles.style16Bold,
        ),
        Text(
          "$price جنيه",
          style: AppStyles.style16Bold,
        ),
      ],
    );
  }
}
