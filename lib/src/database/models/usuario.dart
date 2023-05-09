class Usuario {
  Usuario(
      {required this.id,
      required this.correo,
      required this.nombre,
      required this.apellido,
      required this.urlImagenPerfil,
      required this.sexo});

  int id;
  String correo;
  String nombre;
  String apellido;
  String urlImagenPerfil;
  String sexo;

  Map<String, String> toJson() => {
        'id': id.toString(),
        'correo': correo,
        'nombre': nombre,
        'apellido': apellido,
        'urlImagenPerfil': urlImagenPerfil,
        'sexo': sexo
      };
}
