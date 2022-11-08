import 'package:intl/intl.dart';

class DateHelper {
  String dateFormat(String str) {
    final _parsedString = DateTime.parse(str);
    return DateFormat("MMMM d - MM, yyyy").format(_parsedString);
  }

  String minuteToSecond(int second) {
    return Duration(seconds: second).toString().substring(2, 7);
  }
}
