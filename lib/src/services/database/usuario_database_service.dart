import 'package:sqflite/sqflite.dart';
import 'package:health_safe_paciente/src/helpers/utils/database_provider.dart';
import 'package:health_safe_paciente/src/models/server/database/database_models.dart';

class UsuarioDatabaseService {
  Future<void> crearUsuario(UsuarioEntity usuario) async {
    final db = await DBProvider.db.database;

    await db.insert("usuario", usuario.toJson(),
        conflictAlgorithm: ConflictAlgorithm.ignore);
  }
}
