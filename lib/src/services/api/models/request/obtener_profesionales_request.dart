class ObtenerProfesionalesRequest {
  int idEspecialidad;
  int idModalidadAtencion;
  int? idLocalidad;

  ObtenerProfesionalesRequest(
      {required this.idEspecialidad,
      required this.idModalidadAtencion,
      this.idLocalidad});

  String request() =>
      "idespecialidad=$idEspecialidad&idmodalidad=$idModalidadAtencion&codpostal=$idLocalidad";
}
