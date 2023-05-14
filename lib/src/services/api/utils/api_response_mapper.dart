import 'dart:convert';
import 'package:health_safe_paciente/src/services/api/utils/api_exceptions.dart';
import 'package:http/http.dart' as http;

Map<String, dynamic> apiResponseMapper(http.Response response) {
  if (response.statusCode == 200 || response.statusCode == 201) {
    Map<String, dynamic> responseJson = jsonDecode(response.body);
    return responseJson;
  } else {
    throw ApiException(message: response.body.toString());
  }
}