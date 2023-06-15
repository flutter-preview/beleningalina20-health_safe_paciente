import 'package:sqflite/sqflite.dart';
import 'package:health_safe_paciente/src/helpers/utils/database_provider.dart';
import 'package:health_safe_paciente/src/models/models.dart';

class EspecialidadDatabaseService {
  Future<void> crearEspecialidad(EspecialidadEntity especialidad) async {
    final db = await DBProvider.db.database;
    await db.insert("especialidad", especialidad.toJson(),
        conflictAlgorithm: ConflictAlgorithm.ignore);
  }
}
