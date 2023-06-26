import 'package:flutter/material.dart';
import 'package:health_safe_paciente/src/services/database/models/consultorio_entity.dart';
import 'package:health_safe_paciente/src/services/database/models/especialidad_entity.dart';
import 'package:health_safe_paciente/src/services/database/models/modalidad_atencion_entity.dart';
import 'package:health_safe_paciente/src/services/database/models/profesional_entity.dart';

class TurnoEntity {
  TurnoEntity({
    required this.id,
    required this.fecha,
    required this.fechaSolicita,
    required this.horaInicio,
    required this.horaFin,
    required this.precio,
    required this.idPago,
    required this.especialidad,
    required this.modalidadAtencion,
    required this.profesional,
    this.consultorio,
  });

  int id;
  DateTime fecha;
  DateTime fechaSolicita;
  TimeOfDay horaInicio;
  TimeOfDay horaFin;
  double precio;
  String idPago;
  EspecialidadEntity especialidad;
  ModalidadAtencionEntity modalidadAtencion;
  ConsultorioEntity? consultorio;
  ProfesionalEntity profesional;

  Map<String, String> toJson() => {
        'id': id.toString(),
        'fecha': fecha.toString(),
        'fechaSolicita': fechaSolicita.toString(),
        'horaInicio': horaInicio.toString(),
        'horaFin': horaFin.toString(),
        'precio': precio.toString(),
        'idPago': idPago,
        'idModalidadAtencion': modalidadAtencion.id.toString(),
        'idConsultorio': consultorio?.id.toString() ?? '',
        'idEspecialidad': especialidad.id.toString(),
        'idProfesional': profesional.id.toString()
      };
}
