import 'package:flutter/material.dart';

extension TimeOfDaysExtensions on TimeOfDay {
  bool isEquals(TimeOfDay time) {
    return hour == time.hour && minute == time.minute;
  }

  String convertToString() {
    var hora = hour.toString();
    var minutos = minute.toString();
    if (hora.length == 1) hora = "0$hora";
    if (minutos.length == 1) minutos = "0$minutos";
    return "$hora:$minutos";
  }

  TimeOfDay add(Duration duration) {
    int hh = hour;
    int mm = minute;
    mm += duration.inMinutes;

    if (mm >= 60) {
      var div = mm / 60;
      var entera = div.truncate();
      var decimal = div - entera;
      hh += entera;
      mm = (decimal * 60).round();
    }
    return TimeOfDay(hour: hh, minute: mm);
  }

  int inMinutes(TimeOfDay time) => getMinutos() - time.getMinutos();

  int getMinutos() => Duration(hours: hour, minutes: minute).inMinutes;
}
