import 'package:flutter/material.dart';
import 'package:nahlachicken/constant.dart';
import 'package:nahlachicken/core/utils/app_styles.dart';

class ClientPrice extends StatelessWidget {
  const ClientPrice({
    super.key,
    required this.price,
  });

  final num price;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          "$price ج.م",
          style: AppStyles.style18Bold.copyWith(color: kAccentColorDark),
        ),
      ),
    );
  }
}
