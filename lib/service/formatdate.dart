import 'dart:core';

import 'package:intl/intl.dart';

class FormatDate {
  String dateFormatShortMonthDayYear(String date) {
    return DateFormat.yMMMd().format(DateTime.parse(date));
  }

  String dateFormatDayNumber(String dateFormat) {
    return DateFormat.d().format(DateTime.parse(dateFormat));
  }

  String dateFormatShortDayName(String date) {
    return DateFormat.E().format(DateTime.parse(date));
  }
}
