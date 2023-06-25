import 'package:sqflite/sqflite.dart';
import 'package:health_safe_paciente/src/services/database/models/modalidad_atencion_entity.dart';
import 'package:health_safe_paciente/src/helpers/database_provider.dart';

class ModalidadAtencionService {
  Future<void> crearModalidadAtencion(
      ModalidadAtencionEntity modalidadAtencion) async {
    final db = await DBProvider.db.database;
    await db.insert("modalidadAtencion", modalidadAtencion.toJson(),
        conflictAlgorithm: ConflictAlgorithm.ignore);
  }
}
