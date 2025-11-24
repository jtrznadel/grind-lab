import 'package:intl/intl.dart';

extension DateTimeExtensions on DateTime {
  String toShortDayName() {
    final dateFormatter = DateFormat('E', 'en_US');
    return dateFormatter.format(this);
  }

  bool isSameDate(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }
}
