import 'dart:convert';

import 'package:health_safe_paciente/src/pages/models/payments.dart';

CheckoutResponse preferenceResponseFromJson(String str) =>
    CheckoutResponse.fromJson(json.decode(str));

String preferenceResponseToJson(CheckoutResponse data) =>
    json.encode(data.toJson());

class CheckoutResponse {
  CheckoutResponse({
    required this.status,
    required this.checkout,
  });

  String status;
  Checkout checkout;

  factory CheckoutResponse.fromJson(Map<String, dynamic> json) =>
      CheckoutResponse(
        status: json["status"].toString(),
        checkout: Checkout.fromJson(json["response"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "response": checkout.toJson(),
      };
}
