import 'package:flutter/services.dart';

class DecimalTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text == '') return newValue;
    final newText = newValue.text;

    if (RegExp(r'^\d*\.?\d*$').hasMatch(newText)) {
      return newValue;
    }

    return oldValue;
  }
}
