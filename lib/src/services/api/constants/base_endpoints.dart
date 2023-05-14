import 'package:health_safe_paciente/src/services/api/utils/environments.dart';

class BaseEndpoints {
  static const String login = '${Environments.apiUrl}/auth/login';
  static const String renew = '${Environments.apiUrl}/auth/renovartoken';

  static const String registroUsuario = '${Environments.apiUrl}/usuarios';

  static const String obtenerEspecialidades =
      '${Environments.apiUrl}/especialidades';
  static const String obtenerModalidadesAtencion =
      '${Environments.apiUrl}/modalidades';
  static const String obtenerLocalidades = '${Environments.apiUrl}/localidades';

  static const String obtenerProfesionales =
      '${Environments.apiUrl}/profesionales';

  static const String obtenerAgendasTurnosPorProfesional =
      '${Environments.apiUrl}/agendas/profesional';

  static const String crearTurno = '${Environments.apiUrl}/api/turnos';
  static const String obtenerTurnosPorPaciente =
      '${Environments.apiUrl}/api/turnos/paciente';

  static const String obtenerMensajes = '${Environments.apiUrl}/mensajes';
}
