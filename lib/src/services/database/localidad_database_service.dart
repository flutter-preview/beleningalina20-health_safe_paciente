import 'package:sqflite/sqflite.dart';
import 'package:health_safe_paciente/src/helpers/utils/database_provider.dart';
import 'package:health_safe_paciente/src/models/models.dart';

class LocalidadDatabaseService {
  Future<void> crearLocalidad(LocalidadEntity localidad) async {
    final db = await DBProvider.db.database;
    await db.insert("localidad", localidad.toJson(),
        conflictAlgorithm: ConflictAlgorithm.ignore);
  }
}
