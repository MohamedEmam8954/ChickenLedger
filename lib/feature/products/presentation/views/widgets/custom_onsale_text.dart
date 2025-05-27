import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:nahlachicken/constant.dart';
import 'package:nahlachicken/core/utils/app_styles.dart';

class CustomOnSaleText extends StatelessWidget {
  const CustomOnSaleText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: -1,
      child: Row(
        spacing: 2,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            "عروض",
            style: AppStyles.style20Bold.copyWith(color: kAccentColorDark),
          ),
          Icon(
            IconlyLight.discount,
            color: kAccentColorDark,
            size: 28,
          )
        ],
      ),
    );
  }
}
