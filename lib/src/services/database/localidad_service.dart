import 'package:sqflite/sqflite.dart';
import 'package:health_safe_paciente/src/services/database/models/localidad_entity.dart';
import 'package:health_safe_paciente/src/helpers/database_provider.dart';

class LocalidadService {
  Future<void> crearLocalidad(LocalidadEntity localidad) async {
    final db = await DBProvider.db.database;
    await db.insert("localidad", localidad.toJson(),
        conflictAlgorithm: ConflictAlgorithm.ignore);
  }
}
