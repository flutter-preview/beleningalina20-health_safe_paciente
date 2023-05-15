import 'package:flutter/material.dart';
import 'package:health_safe_paciente/src/helpers/functions/extensions.dart';
import 'package:health_safe_paciente/src/models/core/core_models.dart';

class TurnoDto {
  TurnoDto(
      {this.id,
      required this.fecha,
      required this.horaInicio,
      required this.horaFin,
      this.fechaSolicita,
      required this.especialidad,
      this.idPago,
      this.agendaTurnos,
      this.disponible = true,
      this.idPaciente});

  int? id;
  DateTime fecha;
  TimeOfDay horaInicio;
  TimeOfDay horaFin;
  DateTime? fechaSolicita;
  EspecialidadDto especialidad;
  String? idPago;

  AgendaTurnosDto? agendaTurnos;
  bool disponible;

  int? idPaciente;

  @override
  String toString() => "$fecha - $horaInicio $horaFin";

  Map<String, String> toJson() => {
        "id": id.toString(),
        "idpago": idPago.toString(),
        "idagendaturno": agendaTurnos?.id.toString() ?? '',
        "idpaciente": idPaciente.toString(),
        "horainicio": horaInicio.toTimeString(),
        "horaFin": horaFin.toTimeString(),
        "fecha": fecha.toString(),
        "idEspecialidad": especialidad.id.toString(),
        "idPaciente": idPaciente.toString()
      };
}
