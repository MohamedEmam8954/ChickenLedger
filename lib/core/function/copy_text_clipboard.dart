import 'package:flutter/services.dart';

copyData({required String text}) {
  Clipboard.setData(ClipboardData(text: text));
}
