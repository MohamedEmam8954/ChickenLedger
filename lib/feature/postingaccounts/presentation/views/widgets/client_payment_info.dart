import 'package:flutter/material.dart';

class ClientPaymentInfo extends StatelessWidget {
  const ClientPaymentInfo({
    super.key,
    required this.color,
    required this.icon,
    required this.title,
    required this.date,
    required this.amount,
  });

  final Color color;
  final IconData icon;
  final String title;
  final dynamic date;
  final String amount;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(16),
      leading: CircleAvatar(
        radius: 24,
        backgroundColor: color.withValues(alpha: 0.1),
        child: Icon(icon, color: color),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: color,
          fontSize: 16,
        ),
      ),
      subtitle: Text(
        date,
        style: TextStyle(
          fontSize: 14,
          color: Colors.grey[600],
        ),
      ),
      trailing: Text(
        amount,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: color,
          fontSize: 16,
        ),
      ),
    );
  }
}
