import 'dart:io';

import 'package:flutter/material.dart';

class DatosUsuarioFormProvider extends ChangeNotifier {
  GlobalKey<FormState> correoKey = GlobalKey<FormState>();
  GlobalKey<FormState> contrasenaKey = GlobalKey<FormState>();

  bool _modificarCorreo = false;
  bool _modificarContrasena = false;
  bool _modificarImagenPerfil = false;

  bool get modificarCorreo => _modificarCorreo;
  set modificarCorreo(bool value) {
    _modificarCorreo = value;
    notifyListeners();
  }

  bool get modificarContrasena => _modificarContrasena;
  set modificarContrasena(bool value) {
    _modificarContrasena = value;
    notifyListeners();
  }

  bool get modificarImagenPerfil => _modificarImagenPerfil;
  set modificarImagenPerfil(bool value) {
    _modificarImagenPerfil = value;
    notifyListeners();
  }

  String? _correo;
  String? get correo => _correo;
  set correo(String? value) {
    _correo = value;
    notifyListeners();
  }

  String? _contrasena;
  String? get contrasena => _contrasena;
  set contrasena(String? value) {
    _contrasena = value;
    notifyListeners();
  }

  File? _imagenPerfil;
  File? get imagenPerfil => _imagenPerfil;
  set imagenPerfil(File? value) {
    _imagenPerfil = value;
    notifyListeners();
  }

  String? correoValidator(String? value) {
    if (value == null || value == '') return null;
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(pattern);

    return regExp.hasMatch(value) ? null : 'No tiene formato de correo';
  }

  String? contrasenaValidator(String? value) {
    if (value == null || value == '') return null;

    String pattern = r'^(?=\w*\d)(?=\w*[A-Z])(?=\w*[a-z])\S{8,16}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value)
        ? null
        : 'Debe tener entre 8 a 16 caracteres y 1 mayúscula';
  }

  bool esValidoCorreo() {
    if (correoKey.currentState == null) return false;
    return correoKey.currentState!.validate() && correo != null;
  }

  bool esValidaContrasena() {
    if (contrasenaKey.currentState == null) return false;
    return contrasenaKey.currentState!.validate() && contrasena != null;
  }
}
