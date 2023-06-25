import 'package:flutter/material.dart';

class DetalleSolicitudTurnoProvider with ChangeNotifier {
  String _comentario = '';

  String get comentario => _comentario;
  set comentario(String value) {
    _comentario = value;
    notifyListeners();
  }
}
