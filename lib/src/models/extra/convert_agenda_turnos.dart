import 'package:health_safe_paciente/src/models/core/core_models.dart';
import 'package:health_safe_paciente/src/models/extra/mappers.dart';
import 'package:health_safe_paciente/src/models/server/api/api_models.dart';

class ConvertAgendaTurnosToAgendaTurnosDto {
  static AgendaTurnosDto convert(AgendaTurnos agendaTurnos) => AgendaTurnosDto(
      id: agendaTurnos.id,
      fechaDesde: agendaTurnos.fechaDesde,
      fechaHasta: agendaTurnos.fechaHasta,
      horaInicio: agendaTurnos.horaInicio,
      horaFin: agendaTurnos.horaFin,
      duracion: agendaTurnos.duracion,
      precio: agendaTurnos.precio,
      modalidadAtencion: ConvertModalidadAtencionToModalidadAtencionDto.convert(
          agendaTurnos.modalidadAtencion),
      consultorio: (agendaTurnos.consultorio != null)
          ? ConvertConsultorioToConsultorioDto.convert(
              agendaTurnos.consultorio!)
          : null,
      turnosReservados: agendaTurnos.turnosReservados
          .map((turno) => ConvertTurnoToTurnoDto.convert(turno))
          .toList(),
      profesional: ConvertProfesionalToProfesionalDto.convert(
          agendaTurnos.profesional!));
}
