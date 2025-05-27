import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:nahlachicken/core/utils/app_styles.dart';
import 'package:nahlachicken/core/utils/assets.dart';

class CustomEmptyWidget extends StatelessWidget {
  const CustomEmptyWidget({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Lottie.asset(
          Assets.imagesNoPrices,
          width: 200,
          height: 200,
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          style: AppStyles.style16Bold.copyWith(
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
