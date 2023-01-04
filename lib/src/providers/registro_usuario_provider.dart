import 'dart:io';

import 'package:flutter/material.dart';

class RegistroUsuarioProvider with ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // PageView
  int _paginaActual = 0;
  int cantidadPages = 3;
  final PageController _pageController = PageController(initialPage: 0);

  int get paginaActual => _paginaActual;
  set paginaActual(int value) {
    _paginaActual = value;
    notifyListeners();
  }

  PageController get pageController => _pageController;

  // Form

  List<String> sexos = ['Femenino', 'Masculino'];

  String correo = '';
  String contrasena = '';
  String dni = '';
  String nombre = '';
  String apellido = '';
  File? _imagenPerfil;
  File? _imagenDniFrente;
  File? _imagenDniDorso;
  String sexo = 'Femenino';
  DateTime? _fechaNacimiento;

  bool _isLoading = false;

  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  DateTime? get fechaNacimiento => _fechaNacimiento;
  set fechaNacimiento(DateTime? value) {
    _fechaNacimiento = value;
    notifyListeners();
  }

  File? get imagenPerfil => _imagenPerfil;
  set imagenPerfil(File? value) {
    _imagenPerfil = value;
    notifyListeners();
  }

  File? get imagenDniFrente => _imagenDniFrente;
  set imagenDniFrente(File? value) {
    _imagenDniFrente = value;
    notifyListeners();
  }

  File? get imagenDniDorso => _imagenDniDorso;
  set imagenDniDorso(File? value) {
    _imagenDniDorso = value;
    notifyListeners();
  }

  bool isValidForm() {
    if (formKey.currentState == null) return false;
    return formKey.currentState!.validate() && imagenPerfil != null;
  }

  String? correoValidator(String? value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(pattern);

    return regExp.hasMatch(value ?? '') ? null : 'No tiene formato de correo';
  }

  String? contrasenaValidator(String? value) {
    String pattern = r'^(?=\w*\d)(?=\w*[A-Z])(?=\w*[a-z])\S{8,16}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value ?? '')
        ? null
        : 'Debe tener entre 8 a 16 caracteres y 1 mayúscula';
  }

  String? dniValidator(String? value) {
    String pattern = r'[0-9]{8}';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value ?? '') ? null : 'Ingrese un dni válido';
  }

  String? fechaNacimientoValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Ingrese su fecha de nacimiento';
    }
    final date = DateTime.parse(value);
    return esMayorDeEdad(date) ? null : 'Debe ser mayor de edad';
  }

  bool esMayorDeEdad(DateTime fechaNacimiento) {
    double edad = DateTime.now().difference(fechaNacimiento).inDays / 365;
    return edad >= 18;
  }
}
