import 'package:health_safe_paciente/src/models/core/core_models.dart';
import 'package:health_safe_paciente/src/models/extra/mappers.dart';
import 'package:health_safe_paciente/src/models/server/api/api_models.dart';
import 'package:health_safe_paciente/src/models/server/database/database_models.dart';

class ConvertTurnoToTurnoDto {
  static TurnoDto convert(Turno turno) => TurnoDto(
        id: turno.id,
        fecha: turno.fecha,
        horaInicio: turno.horaInicio,
        horaFin: turno.horaFin,
        fechaSolicita: turno.fechaSolicita,
        especialidad:
            ConvertEspecialidadToEspecialidadDto.convert(turno.especialidad),
        idPago: turno.idPago,
        disponible: false,
        agendaTurnos: (turno.agendaTurnos != null)
            ? ConvertAgendaTurnosToAgendaTurnosDto.convert(turno.agendaTurnos!)
            : null,
      );
}

class ConvertTurnoDtoToTurnoEntity {
  static TurnoEntity convert(TurnoDto turno) => TurnoEntity(
        id: turno.id!,
        fecha: turno.fecha,
        horaInicio: turno.horaInicio,
        horaFin: turno.horaFin,
        fechaSolicita: turno.fechaSolicita ?? DateTime.now(),
        precio: turno.agendaTurnos!.precio,
        idAgendaTurnos: turno.agendaTurnos!.id,
        modalidadAtencion:
            ConvertModalidadAtencionDtoToModalidadAtencionEntity.convert(
                turno.agendaTurnos!.modalidadAtencion),
        profesional: ConvertProfesionalDtoToProfesionalEntity.convert(
            turno.agendaTurnos!.profesional!),
        especialidad: ConvertEspecialidadDtoToEspecialidadEntity.convert(
            turno.especialidad),
        idPago: turno.idPago ?? '',
      );
}
