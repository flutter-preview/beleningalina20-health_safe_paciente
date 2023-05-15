import 'package:health_safe_paciente/src/models/server/api_mercado_pago/api_mercado_pago_models.dart';

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
