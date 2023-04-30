extension DateTimeExtensions on DateTime {
  String convertDateTimeToString() {
    return '$year-${(day < 10) ? '0$day' : day}-${(month < 10) ? '0$month' : month}';
  }

  String convertDateTimeToLongFormat() {
    String weekdayName = "";
    switch (weekday) {
      case 1:
        weekdayName = "Lunes";
        break;
      case 2:
        weekdayName = "Martes";
        break;
      case 3:
        weekdayName = "Miercoles";
        break;
      case 4:
        weekdayName = "Jueves";
        break;
      case 5:
        weekdayName = "Viernes";
        break;
      case 6:
        weekdayName = "Sabado";
        break;
      case 7:
        weekdayName = "Domingo";
        break;
      default:
        throw Exception("Day not founded");
    }

    String monthName = "";
    switch (month) {
      case 1:
        monthName = "enero";
        break;
      case 2:
        monthName = "febrero";
        break;
      case 3:
        monthName = "marzo";
        break;
      case 4:
        monthName = "abril";
        break;
      case 5:
        monthName = "mayo";
        break;
      case 6:
        monthName = "junio";
        break;
      case 7:
        monthName = "julio";
        break;
      case 8:
        monthName = "agosto";
        break;
      case 9:
        monthName = "septiembre";
        break;
      case 10:
        monthName = "octubre";
        break;
      case 11:
        monthName = "noviembre";
        break;
      case 12:
        monthName = "diciembre";
        break;
      default:
        throw Exception("Month not founded");
    }
    return "$weekdayName $day de $monthName de $year";
  }
}
