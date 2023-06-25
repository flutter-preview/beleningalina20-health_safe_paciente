import 'package:flutter/material.dart';
import 'package:health_safe_paciente/src/models/models.dart';
import 'package:health_safe_paciente/src/services/api/models/models.dart';

class AgendaTurnosDto {
  int id;
  DateTime fechaDesde;
  DateTime? fechaHasta;
  TimeOfDay horaInicio;
  TimeOfDay horaFin;
  int duracion;
  double precio;
  ModalidadAtencionDto modalidadAtencion;
  ConsultorioDto? consultorio;

  List<TurnoReservadoDto> turnosReservados;

  ProfesionalDto? profesional;

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

  factory AgendaTurnosDto.fromApi(AgendaTurnos agendaTurnos) => AgendaTurnosDto(
      id: agendaTurnos.id,
      fechaDesde: agendaTurnos.fechaDesde,
      fechaHasta: agendaTurnos.fechaHasta,
      horaInicio: agendaTurnos.horaInicio,
      horaFin: agendaTurnos.horaFin,
      duracion: agendaTurnos.duracion,
      precio: agendaTurnos.precio,
      turnosReservados: List<TurnoReservadoDto>.from(agendaTurnos
          .turnosReservados
          .map((turno) => TurnoReservadoDto.fromApi(turno))),
      profesional: (agendaTurnos.profesional != null)
          ? ProfesionalDto.fromApi(agendaTurnos.profesional!)
          : null,
      modalidadAtencion:
          ModalidadAtencionDto.fromApi(agendaTurnos.modalidadAtencion));
}
