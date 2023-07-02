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
  String comentario;

  CrearTurnoRequest(
      {required this.fecha,
      required this.horaInicio,
      required this.horaFin,
      required this.idAgendaTurnos,
      required this.idPagoMercadoPago,
      required this.idEspecialidad,
      required this.idPaciente,
      required this.idProfesional,
      this.comentario = ''});

  Map<String, dynamic> toJson() => {
        'fecha': fecha.toString(),
        'horainicio': horaInicio.convertToString(),
        'horafin': horaFin.convertToString(),
        'idagenda': idAgendaTurnos,
        'idespecialidad': idEspecialidad,
        'idpaciente': idPaciente,
        'idpagomercadopago': idPagoMercadoPago,
        'comentario': comentario
      };
  String request() => jsonEncode(toJson());
}
