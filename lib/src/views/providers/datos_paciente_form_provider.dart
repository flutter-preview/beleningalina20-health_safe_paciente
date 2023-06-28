import 'package:flutter/material.dart';

class DatosPacienteFormProvider extends ChangeNotifier {
  bool _modificarOcupacion = false;

  bool get modificarOcupacion => _modificarOcupacion;
  set modificarOcupacion(bool value) {
    _modificarOcupacion = value;
    notifyListeners();
  }

  String? _ocupacion;

  String? get ocupacion => _ocupacion;
  set ocupacion(String? value) {
    _ocupacion = value;
    notifyListeners();
  }

  bool esValidaOcupacion() {
    return ocupacion != null;
  }
}
