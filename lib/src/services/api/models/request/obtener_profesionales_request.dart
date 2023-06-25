class ObtenerProfesionalesRequest {
  int idEspecialidad;
  int idModalidadAtencion;
  String? idLocalidad;

  ObtenerProfesionalesRequest(
      {required this.idEspecialidad,
      required this.idModalidadAtencion,
      this.idLocalidad});

  String request() =>
      "idespecialidad=$idEspecialidad&idmodalidad=$idModalidadAtencion&codpostal=$idLocalidad";
}
