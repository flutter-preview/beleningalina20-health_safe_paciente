import 'package:flutter/material.dart';
import 'package:health_safe_paciente/src/models/models.dart';

class LoginProvider with ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String correo = '';
  String contrasena = '';

  bool _isLoading = false;

  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool isValidForm() => formKey.currentState?.validate() ?? false;

  LoginRequest loginRequest() {
    return LoginRequest(correo: correo, contrasena: contrasena);
  }
}
