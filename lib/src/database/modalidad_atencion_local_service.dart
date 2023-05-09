import 'package:health_safe_paciente/src/database/database_provider.dart';
import 'package:health_safe_paciente/src/database/models/local.dart';
import 'package:sqflite/sqflite.dart';

class ModalidadAtencionLocalService {
  Future<void> crearModalidadAtencion(
      ModalidadAtencion modalidadAtencion) async {
    final db = await DBProvider.db.database;
    await db.insert("modalidadAtencion", modalidadAtencion.toJson(),
        conflictAlgorithm: ConflictAlgorithm.ignore);
  }
}
