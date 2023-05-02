import 'package:flutter/material.dart';
import 'package:health_safe_paciente/src/models/models.dart';

CrearTurnoResponse crearTurnoResponseMock = CrearTurnoResponse(
    msg: "Turno dado de alta",
    turno: Turno(
      fechaSolicita: DateTime(2023, 05, 01),
      idPago: "id_pago_mercado_pago",
      id: 2,
      fecha: DateTime(2023, 05, 05),
      horaInicio: const TimeOfDay(hour: 10, minute: 00),
      horaFin: const TimeOfDay(hour: 10, minute: 30),
    ));
