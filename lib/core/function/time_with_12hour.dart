import 'package:intl/intl.dart';

timeWith12Hour(DateTime ordertime) {
  String date = DateFormat('yyyy-MM-dd').format(ordertime);
  String time = DateFormat('hh:mm a').format(ordertime);

  return "$date $time";
}
