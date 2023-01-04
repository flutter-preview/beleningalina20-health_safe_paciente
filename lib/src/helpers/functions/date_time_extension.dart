extension DateTimeExtensions on DateTime {
  String longDateTimeString() {
    return '$year-${(day < 10) ? '0$day' : day}-${(month < 10) ? '0$month' : month}';
  }
}
