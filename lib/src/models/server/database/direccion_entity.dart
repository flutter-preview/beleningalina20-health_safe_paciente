import 'package:health_safe_paciente/src/models/server/database/localidad_entity.dart';

class DireccionEntity {
  DireccionEntity({
    required this.id,
    required this.calle,
    required this.numero,
    required this.piso,
    required this.localidad,
  });

  int id;
  String calle;
  int numero;
  int? piso;
  LocalidadEntity localidad;

  Map<String, String> toJson() => {
        'id': id.toString(),
        'calle': calle.toString(),
        'numero': numero.toString(),
        'piso': piso.toString(),
        'idLocalidad': localidad.codigoPostal.toString()
      };
}
