import 'package:flutter/material.dart';

extension StringExtensions on String {
  TimeOfDay toTimeOfDay() {
    var hour = int.tryParse(substring(0, 2));
    var minute = int.tryParse(substring(3, 5));

    if (hour != null && minute != null) {
      return TimeOfDay(hour: hour, minute: minute);
    } else {
      throw Exception("Error al convertir a TimeOfDay");
    }
  }
}
