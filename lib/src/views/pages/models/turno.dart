import 'package:flutter/material.dart';
import 'package:health_safe_paciente/src/models/models.dart';

class TurnoModel {
  ProfesionalDto profesional;
  EspecialidadDto especialidad;
  ModalidadAtencionDto modalidadAtencion;
  ConsultorioDto? consultorio;
  int idAgendaTurnos;
  bool disponible;
  DateTime fecha;
  TimeOfDay horaInicio;
  TimeOfDay horaFin;
  double precio;

  String? idPago;

  String? comentario;

  TurnoModel(
      {required this.profesional,
      required this.disponible,
      required this.idAgendaTurnos,
      required this.modalidadAtencion,
      this.consultorio,
      required this.especialidad,
      required this.fecha,
      required this.horaInicio,
      required this.horaFin,
      required this.precio,
      this.comentario = ''});
}
