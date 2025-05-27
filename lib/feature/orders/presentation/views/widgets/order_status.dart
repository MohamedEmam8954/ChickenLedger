import 'package:flutter/material.dart';

class OrderStaus extends StatelessWidget {
  const OrderStaus({
    super.key,
    required this.color,
    required this.text,
  });

  final Color color;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      children: [
        CircleAvatar(radius: 3.5, backgroundColor: color),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            text,
          ),
        ),
      ],
    );
  }
}
