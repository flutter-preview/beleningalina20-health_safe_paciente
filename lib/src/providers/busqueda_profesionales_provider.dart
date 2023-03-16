import 'package:flutter/material.dart';
import 'package:health_safe_paciente/src/models/models.dart';

class BusquedaProfesionalesProvider with ChangeNotifier {
  Especialidad? _especialidad;
  Especialidad? get especialidad => _especialidad;
  set especialidad(Especialidad? value) {
    _especialidad = value;
    notifyListeners();
  }

  ModalidadAtencion? _modalidadAtencion;
  ModalidadAtencion? get modalidadAtencion => _modalidadAtencion;
  set modalidadAtencion(ModalidadAtencion? value) {
    _modalidadAtencion = value;
    notifyListeners();
  }

  Localidad? _localidad;
  Localidad? get localidad => _localidad;
  set localidad(Localidad? value) {
    _localidad = value;
    notifyListeners();
  }

  bool esValidaBusqueda() {
    if (especialidad == null || modalidadAtencion == null) return false;
    if (modalidadAtencion?.descripcion == "Presencial" && localidad == null) {
      return false;
    }
    return true;
  }
}
