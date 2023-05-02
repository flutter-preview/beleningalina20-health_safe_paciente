import 'package:health_safe_paciente/src/pages/models/payments.dart';

class Preference {
  Preference({
    required this.items,
    this.additionalInfo,
    this.autoReturn,
    this.backUrls,
    this.dateOfExpiration,
    this.expirationDateFrom,
    this.expirationDateTo,
    this.expires,
    this.externalReference,
    this.differentialPricing,
    this.marketplace,
    this.marketplaceFee,
    this.metadata,
    this.notificationUrl,
    this.payer,
    this.shipments,
    this.paymentMethods,
  });

  List<Item> items;
  String? additionalInfo;
  String? autoReturn; // approved, all
  BackUrls? backUrls;
  String? dateOfExpiration;
  String? expirationDateFrom;
  String? expirationDateTo;
  bool? expires;
  String? externalReference;
  DifferentialPricing? differentialPricing;
  String? marketplace = "NONE";
  int? marketplaceFee = 0;
  Map<String, dynamic>? metadata;
  String? notificationUrl;
  Payer? payer;
  Shipments? shipments;
  PaymentMethods? paymentMethods;

  factory Preference.fromJson(Map<String, dynamic> json) => Preference(
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        additionalInfo: json["additional_info"],
        autoReturn: json["auto_return"],
        backUrls: BackUrls.fromJson(json["back_urls"]),
        dateOfExpiration: json["date_of_expiration"],
        expirationDateFrom: json["expiration_date_from"],
        expirationDateTo: json["expiration_date_to"],
        expires: json["expires"],
        externalReference: json["external_reference"],
        differentialPricing:
            DifferentialPricing.fromJson(json["differential_pricing"]),
        marketplace: json["marketplace"],
        marketplaceFee: json["marketplace_fee"],
        metadata: json["metadata"],
        notificationUrl: json["notification_url"],
        payer: Payer.fromJson(json["payer"]),
        shipments: Shipments.fromJson(json["shipments"]),
        paymentMethods: PaymentMethods.fromJson(json["payment_methods"]),
      );

  Map<String, dynamic> toJson() => {
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
        "additional_info": additionalInfo,
        "auto_return": autoReturn,
        "back_urls": backUrls?.toJson(),
        "date_of_expiration": dateOfExpiration,
        "expiration_date_from": expirationDateFrom,
        "expiration_date_to": expirationDateTo,
        "expires": expires,
        "external_reference": externalReference,
        "differential_pricing": differentialPricing?.toJson(),
        "marketplace": marketplace,
        "marketplace_fee": marketplaceFee,
        "metadata": metadata,
        "notification_url": notificationUrl,
        "payer": payer?.toJson(),
        "shipments": shipments?.toJson(),
        "payment_methods": paymentMethods?.toJson(),
      };
}
