import 'package:health_safe_paciente/src/database/models/local.dart' as local;
import 'package:health_safe_paciente/src/models/mappers/mappers.dart';
import 'package:health_safe_paciente/src/models/models.dart' as remote;

class ConvertTurno {
  static local.Turno convert(remote.Turno turno) => local.Turno(
      id: turno.id,
      especialidad: ConvertEspecialidad.convert(turno.especialidad!),
      fecha: turno.fecha,
      fechaSolicita: turno.fechaSolicita,
      horaFin: turno.horaFin,
      horaInicio: turno.horaInicio,
      idAgendaTurnos: turno.agendaTurnos?.id ?? 0,
      idPago: turno.idPago ?? '',
      modalidadAtencion: ConvertModalidadAtencion.convert(
          turno.agendaTurnos!.modalidadAtencion),
      precio: turno.agendaTurnos?.precio ?? 0.0,
      profesional: ConvertProfesional.convert(turno.agendaTurnos!.profesional!),
      consultorio: ConvertConsultorio.convert(turno.agendaTurnos?.consultorio));
}
