import 'package:sqflite/sqflite.dart';
import 'package:health_safe_paciente/src/helpers/utils/database_provider.dart';
import 'package:health_safe_paciente/src/models/models.dart';

class ModalidadAtencionDatabaseService {
  Future<void> crearModalidadAtencion(
      ModalidadAtencionEntity modalidadAtencion) async {
    final db = await DBProvider.db.database;
    await db.insert("modalidadAtencion", modalidadAtencion.toJson(),
        conflictAlgorithm: ConflictAlgorithm.ignore);
  }
}
