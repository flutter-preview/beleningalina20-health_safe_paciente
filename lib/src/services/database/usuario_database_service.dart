import 'package:sqflite/sqflite.dart';
import 'package:health_safe_paciente/src/services/database/models/usuario_entity.dart';
import 'package:health_safe_paciente/src/helpers/database_provider.dart';

class UsuarioDatabaseService {
  Future<void> crearUsuario(UsuarioEntity usuario) async {
    final db = await DBProvider.db.database;

    await db.insert("usuario", usuario.toJson(),
        conflictAlgorithm: ConflictAlgorithm.ignore);
  }
}
