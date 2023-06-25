import 'package:sqflite/sqflite.dart';
import 'package:health_safe_paciente/src/services/database/models/consultorio_entity.dart';
import 'package:health_safe_paciente/src/helpers/database_provider.dart';
import 'package:health_safe_paciente/src/services/database/database.dart';

class ConsultorioService {
  Future<void> crearConsultorio(ConsultorioEntity consultorio) async {
    final db = await DBProvider.db.database;
    await LocalidadService().crearLocalidad(consultorio.direccion.localidad);
    await DireccionService().crearDireccion(consultorio.direccion);
    await db.insert("consultorio", consultorio.toJson(),
        conflictAlgorithm: ConflictAlgorithm.ignore);
  }
}
