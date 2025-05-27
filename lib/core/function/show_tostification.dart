import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

void showTostification(
    BuildContext context, String message, Color color, IconData icon) {
  toastification.show(
    context: context,
    type: ToastificationType.success,
    style: ToastificationStyle.fillColored,
    autoCloseDuration: const Duration(seconds: 3),
    title: Text(
      message,
      style: TextStyle(color: Colors.white),
    ),
    alignment: Alignment.bottomCenter,
    direction: TextDirection.rtl,
    animationDuration: const Duration(milliseconds: 300),
    icon: Icon(icon, color: Colors.white),
    showIcon: true,
    primaryColor: color,
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
    margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    borderRadius: BorderRadius.circular(12),
    boxShadow: const [
      BoxShadow(
        color: Color(0x07000000),
        blurRadius: 16,
        offset: Offset(0, 16),
        spreadRadius: 0,
      )
    ],
    showProgressBar: true,
    closeOnClick: true,
    pauseOnHover: true,
    dragToClose: true,
    applyBlurEffect: false,
  );
}
