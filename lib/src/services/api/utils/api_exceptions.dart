class ApiException implements Exception {
  final String message;

  ApiException({required this.message});

  factory ApiException.fromJson(Map<String, dynamic> json) =>
      ApiException(message: json["msg"]);

  @override
  String toString() {
    return message;
  }
}
