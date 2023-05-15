import 'package:flutter/material.dart';
import 'package:health_safe_paciente/src/models/core/core_models.dart';

class BusquedaProfesionalesProvider with ChangeNotifier {
  EspecialidadDto? _especialidad;
  EspecialidadDto? get especialidad => _especialidad;
  set especialidad(EspecialidadDto? value) {
    _especialidad = value;
    notifyListeners();
  }

  ModalidadAtencionDto? _modalidadAtencion;
  ModalidadAtencionDto? get modalidadAtencion => _modalidadAtencion;
  set modalidadAtencion(ModalidadAtencionDto? value) {
    _modalidadAtencion = value;
    notifyListeners();
  }

  LocalidadDto? _localidad;
  LocalidadDto? get localidad => _localidad;
  set localidad(LocalidadDto? value) {
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
