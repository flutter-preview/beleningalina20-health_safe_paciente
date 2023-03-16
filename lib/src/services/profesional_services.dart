import 'dart:io';
import 'package:health_safe_paciente/src/models/models.dart';
import 'package:health_safe_paciente/src/models/responses/obtener_profesionales_response.dart';
import 'package:health_safe_paciente/src/services/mocks/obtener_profesionales_mock.dart';
import 'package:health_safe_paciente/src/services/utils/api_exceptions.dart';

class ProfesionalService {
  Future<List<Profesional>> obtenerProfesionales(
    Especialidad? especialidad,
    ModalidadAtencion? modalidadAtencion,
    Localidad? localidad,
  ) async {
    return await obtenerProfesionalesService(
            especialidad, modalidadAtencion, localidad)
        .then((value) {
      return value.profesionales;
    }).onError((error, stackTrace) {
      throw FetchDataException(msg: error.toString());
    });
  }

  Future<ObtenerProfesionalesResponse> obtenerProfesionalesService(
    Especialidad? especialidad,
    ModalidadAtencion? modalidadAtencion,
    Localidad? localidad,
  ) async {
    // late Map<String, dynamic> response;
    // Uri url = Uri.parse('${Environments.apiUrl}/especialidades/');

    try {
      /*final resp = await http.get(url).timeout(const Duration(seconds: 3));

      debugPrint(resp.body.toString());

      response = apiResponseMapper(resp);

      return ObtenerEspecialidadesResponse.fromJson(response);*/
      Future.delayed(const Duration(seconds: 5));
      return obtenerProfesionalesResponseMock;
    } on SocketException {
      throw FetchDataException(msg: 'No Internet Connection');
    } catch (e) {
      rethrow;
    }
  }
}
