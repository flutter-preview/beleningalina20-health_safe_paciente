import 'package:flutter/material.dart';

class CalificacionAtencionProfesionalProvider extends ChangeNotifier {
  double _rating = 0.0;

  bool _isLoading = false;

  double get rating => _rating;
  set rating(double value) {
    _rating = value;
    notifyListeners();
  }

  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}
