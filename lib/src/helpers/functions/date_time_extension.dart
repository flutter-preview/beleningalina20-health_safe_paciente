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
        monthName = "Enero";
        break;
      case 2:
        monthName = "Febrero";
        break;
      case 3:
        monthName = "Marzo";
        break;
      case 4:
        monthName = "Abril";
        break;
      case 5:
        monthName = "Mayo";
        break;
      case 6:
        monthName = "Junio";
        break;
      case 7:
        monthName = "Julio";
        break;
      case 8:
        monthName = "Agosto";
        break;
      case 9:
        monthName = "Septiembre";
        break;
      case 10:
        monthName = "Octubre";
        break;
      case 11:
        monthName = "Noviembre";
        break;
      case 12:
        monthName = "Diciembre";
        break;
      default:
        throw Exception("Month not founded");
    }
    return "$weekdayName $day de $monthName de $year";
  }
}
