import 'package:health_safe_paciente/src/models/server/database/direccion_entity.dart';

class ConsultorioEntity {
  ConsultorioEntity(
      {required this.id, this.descripcion, required this.direccion});

  int id;
  String? descripcion;
  DireccionEntity direccion;

  Map<String, String> toJson() => {
        'id': id.toString(),
        'descripcion': descripcion.toString(),
        'idDireccion': direccion.id.toString()
      };
}
