import 'package:flutter/material.dart';
import 'package:health_safe_paciente/src/models/models.dart';

class PerfilProfesionalProvider with ChangeNotifier {
  int _paginaActual = 0;

  int get paginaActual => _paginaActual;
  set paginaActual(int value) {
    _paginaActual = value;
    notifyListeners();
  }

  List<AgendaTurnosDto> agendasTurnosProfesional = [];

  PerfilProfesionalProvider({required this.agendasTurnosProfesional}) {
    _fechaAgendaTurnosSeleccionada = agendasTurnosProfesional.first.fechaDesde;
  }

  ModalidadAtencionDto? _modalidadAtencionSeleccionada;
  ModalidadAtencionDto? get modalidadAtencionSeleccionada =>
      _modalidadAtencionSeleccionada;
  set modalidadAtencionSeleccionada(ModalidadAtencionDto? value) {
    _modalidadAtencionSeleccionada = value;
    notifyListeners();
  }

  DateTime? _fechaAgendaTurnosSeleccionada;
  DateTime? get fechaAgendaTurnosSeleccionada => _fechaAgendaTurnosSeleccionada;
  set fechaAgendaTurnosSeleccionada(DateTime? value) {
    _fechaAgendaTurnosSeleccionada = value;
    notifyListeners();
  }

  ConsultorioDto? _consultorioSeleccionado;
  ConsultorioDto? get consultorioSeleccionado => _consultorioSeleccionado;
  set consultorioSeleccionado(ConsultorioDto? value) {
    _consultorioSeleccionado = value;
    notifyListeners();
  }

  List<DateTime> fechasDisponibles(List<AgendaTurnosDto> agendasTurnos) {
    List<DateTime> fechasAgendasTurnos = [];

    for (var agendaTurnos in agendasTurnos) {
      if (agendaTurnos.fechaHasta == null) {
        if (!fechasAgendasTurnos.contains(agendaTurnos.fechaDesde)) {
          fechasAgendasTurnos.add(agendaTurnos.fechaDesde);
        }
      } else {
        DateTime fechaAux = agendaTurnos.fechaDesde;

        while (fechaAux.isBefore(agendaTurnos.fechaHasta!)) {
          if (!fechasAgendasTurnos.contains(fechaAux)) {
            fechasAgendasTurnos.add(fechaAux);
          }
          fechaAux = fechaAux.add(const Duration(days: 1));
        }

        fechasAgendasTurnos.add(agendaTurnos.fechaHasta!);
      }
    }

    return fechasAgendasTurnos.toList();
  }

  List<ModalidadAtencionDto> modalidadesAtencionDisponible(
      List<AgendaTurnosDto> agendasTurnos) {
    List<ModalidadAtencionDto> modalidadesAtencion = [];
    List<int> idModalidadesAtencion = [];
    for (var agendaTurnos in agendasTurnos) {
      if (!idModalidadesAtencion.contains(agendaTurnos.modalidadAtencion.id)) {
        modalidadesAtencion.add(agendaTurnos.modalidadAtencion);
        idModalidadesAtencion.add(agendaTurnos.modalidadAtencion.id);
      }
    }
    return modalidadesAtencion;
  }

  List<ConsultorioDto> consultoriosDisponibles(
      List<AgendaTurnosDto> agendasTurnos) {
    List<ConsultorioDto> consultorios = [];
    List<int> idConsultorios = [];

    for (var agendaTurnos in agendasTurnos) {
      if (agendaTurnos.modalidadAtencion.descripcion == "Presencial" &&
          agendaTurnos.consultorio != null) {
        if (!idConsultorios.contains(agendaTurnos.consultorio!.id)) {
          consultorios.add(agendaTurnos.consultorio!);
          idConsultorios.add(agendaTurnos.modalidadAtencion.id);
        }
      }
    }
    return consultorios;
  }

  bool fechaPerteneceAgendaTurnos(DateTime startDate, DateTime? endDate) {
    if (_fechaAgendaTurnosSeleccionada == null) return false;

    if (endDate == null) {
      return _fechaAgendaTurnosSeleccionada == startDate;
    } else {
      return (_fechaAgendaTurnosSeleccionada!.isAfter(startDate) &&
              _fechaAgendaTurnosSeleccionada!.isBefore(endDate)) ||
          _fechaAgendaTurnosSeleccionada == startDate ||
          _fechaAgendaTurnosSeleccionada == endDate;
    }
  }

  bool consultaTurnosValido() {
    if (_fechaAgendaTurnosSeleccionada != null) {
      if (_modalidadAtencionSeleccionada != null) {
        if (_modalidadAtencionSeleccionada?.descripcion == "Videollamada") {
          if (_consultorioSeleccionado == null) {
            return true;
          } else {
            return false;
          }
        } else {
          if (_consultorioSeleccionado != null) {
            return true;
          } else {
            return false;
          }
        }
      } else {
        return false;
      }
    } else {
      return false;
    }
  }
}
