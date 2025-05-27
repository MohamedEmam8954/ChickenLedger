import 'package:flutter/material.dart';
import 'package:nahlachicken/constant.dart';
import 'package:nahlachicken/core/function/time_with_12hour.dart';
import 'package:nahlachicken/feature/postingaccounts/domain/entities/client_payments_entity.dart';
import 'package:nahlachicken/feature/postingaccounts/presentation/views/widgets/client_payment_info.dart';

class ClientPaymentsItem extends StatelessWidget {
  const ClientPaymentsItem({
    super.key,
    required this.clientPaymentsEntity,
  });

  final ClientPaymentsEntity clientPaymentsEntity;

  @override
  Widget build(BuildContext context) {
    final isPositive = clientPaymentsEntity.isadded ? true : false;

    final icon = isPositive ? Icons.arrow_downward : Icons.arrow_upward;
    final color = isPositive ? Colors.greenAccent : Colors.red;
    final sign = isPositive ? "+" : "-";
    final title = isPositive ? "إضافة مبلغ" : "خصم مبلغ";
    final amount = "$sign ${clientPaymentsEntity.totalPrice} ج.م";
    final date = timeWith12Hour(clientPaymentsEntity.dateTime);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xff161819),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isPositive
              ? Colors.greenAccent.withValues(alpha: 0.1)
              : kAccentColorLight.withValues(alpha: 0.1),
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: isPositive ? Colors.greenAccent : kAccentColorLight,
            blurRadius: 2.5,
            spreadRadius: 1.5,
          ),
        ],
      ),
      child: ClientPaymentInfo(
          color: color, icon: icon, title: title, date: date, amount: amount),
    );
  }
}
