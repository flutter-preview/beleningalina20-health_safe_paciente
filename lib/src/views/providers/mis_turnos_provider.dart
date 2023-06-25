import 'package:flutter/material.dart';

class MisTurnosProvider with ChangeNotifier {
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();

  DateTime get selectedDay => _selectedDay;
  set selectedDay(DateTime value) {
    _selectedDay = value;
    notifyListeners();
  }

  DateTime get focusedDay => _focusedDay;
  set focusedDay(DateTime value) {
    _focusedDay = value;
    notifyListeners();
  }
}
