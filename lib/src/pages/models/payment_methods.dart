import 'package:health_safe_paciente/src/pages/models/payments.dart';

class PaymentMethods {
  PaymentMethods({
    this.excludedPaymentMethods,
    this.excludedPaymentTypes,
    this.defaultPaymentMethodId,
    this.installments,
    this.defaultInstallments,
  });

  List<ExcludedPayment>? excludedPaymentMethods;
  List<ExcludedPayment>? excludedPaymentTypes;
  String? defaultPaymentMethodId;
  int? installments;
  int? defaultInstallments;

  factory PaymentMethods.fromJson(Map<String, dynamic> json) => PaymentMethods(
        excludedPaymentMethods: List<ExcludedPayment>.from(
            json["excluded_payment_methods"]
                .map((x) => ExcludedPayment.fromJson(x))),
        excludedPaymentTypes: List<ExcludedPayment>.from(
            json["excluded_payment_types"]
                .map((x) => ExcludedPayment.fromJson(x))),
        defaultPaymentMethodId: json["default_payment_method_id"],
        installments: json["installments"],
        defaultInstallments: json["default_installments"],
      );

  Map<String, dynamic> toJson() => {
        "excluded_payment_methods":
            List<dynamic>.from(excludedPaymentMethods!.map((x) => x.toJson())),
        "excluded_payment_types":
            List<dynamic>.from(excludedPaymentTypes!.map((x) => x.toJson())),
        "default_payment_method_id": defaultPaymentMethodId,
        "installments": installments,
        "default_installments": defaultInstallments,
      };
}
