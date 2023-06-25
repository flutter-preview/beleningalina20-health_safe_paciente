import 'package:health_safe_paciente/src/helpers/database_provider.dart';
import 'package:health_safe_paciente/src/services/database/database.dart';
import 'package:health_safe_paciente/src/services/database/models/turno_entity.dart';

class TurnoService {
  Future guardarTurno(TurnoEntity turno) async {
    try {
      final db = await DBProvider.db.database;

      await EspecialidadService().crearEspecialidad(turno.especialidad);
      await ModalidadAtencionService()
          .crearModalidadAtencion(turno.modalidadAtencion);

      if (turno.consultorio != null) {
        await ConsultorioService().crearConsultorio(turno.consultorio!);
      }

      await UsuarioService().crearUsuario(turno.profesional.usuario);
      await ProfesionalService().crearProfesional(turno.profesional);
      await db.insert("turno", turno.toJson());
    } catch (e) {
      rethrow;
    }
  }
}
