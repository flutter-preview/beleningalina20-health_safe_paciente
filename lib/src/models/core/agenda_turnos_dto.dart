import 'package:flutter/material.dart';
import 'package:health_safe_paciente/src/models/core/core_models.dart';

class AgendaTurnosDto {
  AgendaTurnosDto(
      {required this.id,
      required this.fechaDesde,
      this.fechaHasta,
      required this.horaInicio,
      required this.horaFin,
      required this.duracion,
      required this.precio,
      required this.modalidadAtencion,
      this.consultorio,
      this.turnosReservados = const [],
      this.profesional});

  int id;
  DateTime fechaDesde;
  DateTime? fechaHasta;
  TimeOfDay horaInicio;
  TimeOfDay horaFin;
  int duracion;
  double precio;
  ModalidadAtencionDto modalidadAtencion;
  ConsultorioDto? consultorio;

  List<TurnoDto> turnosReservados;

  ProfesionalDto? profesional;
}
