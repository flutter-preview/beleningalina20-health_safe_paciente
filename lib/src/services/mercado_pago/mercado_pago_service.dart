import 'package:flutter/services.dart';
import 'package:health_safe_paciente/src/services/mercado_pago/models/preference.dart';
import 'package:health_safe_paciente/src/services/mercado_pago/models/response/checkout_response.dart';
import 'package:mercadopago_sdk/mercadopago_sdk.dart';

class MercadoPagoService {
  Future pagarTurno(Preference preference) async {
    final mercadoPago = MP(MercadoPagoCredentials.mpClientIdPROD,
        MercadoPagoCredentials.mpClientSecretPROD);

    try {
      var result = await mercadoPago.createPreference(preference.toJson());
      CheckoutResponse checkoutResponse = CheckoutResponse.fromJson(result);
      const channelMercadoPago = MethodChannel("health_safe/mercado_pago");
      await channelMercadoPago.invokeMethod("mercadoPago", <String, dynamic>{
        "publicKey":
            MercadoPagoCredentials.mpPublicKeyDEV, // TODO Cambiar a prod
        "preferenceId": checkoutResponse.checkout.id
      });
    } on PlatformException {
      rethrow;
    }
  }
}

class MercadoPagoCredentials {
  static String mpAccessTokenDEV =
      "TEST-4819053031528099-092223-5c6d81ffc40ebb8e5e7325325f41418a-1033528207";
  static String mpPublicKeyDEV = "TEST-d414cf2f-507d-4228-b3a5-e441e4388378";

  static String mpAccessTokenPROD =
      "APP_USR-4819053031528099-092223-54698255f5719f96c9b8edaa1de922df-1033528207";
  static String mpPublicKeyPROD =
      "APP_USR-b8eff05d-30d0-4c0b-a5aa-90db600e1ef5";

  static String mpClientIdPROD = "4819053031528099";
  static String mpClientSecretPROD = "nvRbwL2YPq2o3CcQWaKzM3E9sMEzVHST";
}
