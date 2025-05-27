import 'package:flutter/material.dart';

import 'package:nahlachicken/core/function/time_with_12hour.dart';

class OrderTime extends StatelessWidget {
  const OrderTime({super.key, required this.orderDate});
  final DateTime orderDate;

  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection: TextDirection.ltr,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          timeWith12Hour(orderDate),
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[800],
            fontWeight: FontWeight.w500,
          ),
        ),
        Icon(Icons.access_time, size: 16, color: Colors.grey[800]),
      ],
    );
  }
}
