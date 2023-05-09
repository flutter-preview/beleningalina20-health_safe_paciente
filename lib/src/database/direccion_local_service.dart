import 'package:health_safe_paciente/src/database/database_provider.dart';
import 'package:health_safe_paciente/src/database/models/local.dart';
import 'package:sqflite/sqflite.dart';

class DireccionLocalService {
  Future<void> crearDireccion(Direccion direccion) async {
    final db = await DBProvider.db.database;
    await db.insert("direccion", direccion.toJson(),
        conflictAlgorithm: ConflictAlgorithm.ignore);
  }
}
