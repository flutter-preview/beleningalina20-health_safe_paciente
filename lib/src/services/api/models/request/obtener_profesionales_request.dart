class ObtenerProfesionalesRequest {
  int idEspecialidad;
  int idModalidadAtencion;
  String? idLocalidad;

  ObtenerProfesionalesRequest(
      {required this.idEspecialidad,
      required this.idModalidadAtencion,
      this.idLocalidad});

  @override
  String toString() {
    if (idLocalidad != null) {
      return "idespecialidad=$idEspecialidad&idmodalidad=$idModalidadAtencion&codpostal=$idLocalidad";
    } else {
      return "idespecialidad=$idEspecialidad&idmodalidad=$idModalidadAtencion";
    }
  }
}
