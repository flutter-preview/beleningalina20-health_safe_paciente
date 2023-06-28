import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:health_safe_paciente/src/extensions/extensions.dart';

class CrearTurnoRequest {
  DateTime fecha;
  TimeOfDay horaInicio;
  TimeOfDay horaFin;
  int idAgendaTurnos;
  String idPagoMercadoPago;
  int idPaciente;
  int idEspecialidad;
  int idProfesional;

  CrearTurnoRequest(
      {required this.fecha,
      required this.horaInicio,
      required this.horaFin,
      required this.idAgendaTurnos,
      required this.idPagoMercadoPago,
      required this.idEspecialidad,
      required this.idPaciente,
      required this.idProfesional});

  Map<String, dynamic> toJson() => {
        'fecha': fecha,
        'horainicio': horaInicio.convertToString(),
        'horafin': horaFin.convertToString(),
        'idagendaturnos': idAgendaTurnos,
        'idespecialidad': idEspecialidad,
        'idpaciente': idPaciente
      };
  String request() => jsonEncode(toJson());
}
