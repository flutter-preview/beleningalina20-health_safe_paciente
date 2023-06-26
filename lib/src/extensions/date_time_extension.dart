import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

extension DateTimeExtensions on DateTime {
  String convertToString({bool longFormat = false}) {
    if (longFormat) {
      initializeDateFormatting('es', null);
      String weekday = DateFormat('EEEE', 'es').format(this);
      String month = DateFormat('MMMM', 'es').format(this);

      return "${weekday[0].toUpperCase() + weekday.substring(1).toLowerCase()} $day de $month de $year";
    } else {
      return DateFormat('yyyy/MM/dd').format(this);
    }
  }
}
