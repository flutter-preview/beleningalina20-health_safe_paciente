import 'package:health_safe_paciente/src/pages/models/mercado_pago/payments.dart';

class Checkout {
  Checkout(
      {this.additionalInfo,
      this.autoReturn,
      required this.backUrls,
      required this.binaryMode,
      required this.clientId,
      required this.collectorId,
      this.couponCode,
      this.couponLabels,
      required this.dateCreated,
      this.dateOfExpiration,
      this.expirationDateFrom,
      this.expirationDateTo,
      this.expires,
      required this.id,
      required this.initPoint,
      this.internalMetadata,
      required this.items,
      required this.marketplace,
      required this.marketplaceFee,
      required this.metadata,
      this.notificationUrl,
      this.operationType,
      required this.payer,
      required this.paymentMethods,
      this.defaultInstallments,
      this.processingModes,
      this.productId,
      required this.redirectUrls,
      required this.sandboxInitPoint,
      required this.siteId,
      required this.shipments,
      this.totalAmount,
      this.lastUpdate,
      this.externalReference,
      this.statementDescriptor});

  dynamic additionalInfo;
  dynamic autoReturn;
  BackUrls? backUrls;
  bool binaryMode;
  int clientId;
  int collectorId;
  dynamic couponCode;
  dynamic couponLabels;
  String dateCreated;
  String? dateOfExpiration;
  String? expirationDateFrom;
  String? expirationDateTo;
  bool? expires;
  String id;
  String initPoint;
  Map<String, dynamic>? internalMetadata;
  List<Item> items;
  String marketplace;
  int marketplaceFee;
  Map<String, dynamic> metadata;
  String? notificationUrl;
  String? operationType;
  Payer payer;
  PaymentMethods paymentMethods;
  dynamic defaultInstallments;
  dynamic processingModes;
  dynamic productId;
  BackUrls redirectUrls;
  String sandboxInitPoint;
  String siteId;
  Shipments shipments;
  dynamic totalAmount;
  dynamic lastUpdate;
  String? externalReference;
  String? statementDescriptor;

  factory Checkout.fromJson(Map<String, dynamic> json) => Checkout(
      additionalInfo: json["additional_info "],
      autoReturn: json["auto_return  "],
      backUrls: BackUrls.fromJson(json["back_urls"]),
      binaryMode: json["binary_mode"],
      clientId: int.tryParse(json["client_id"]) as int,
      collectorId: json["collector_id"],
      couponLabels: json["coupon_labels "],
      couponCode: json["coupon_code "],
      dateCreated: json["date_created"],
      dateOfExpiration: json["date_of_expiration"],
      expirationDateFrom: json["expiration_date_from"],
      expirationDateTo: json["expiration_date_to"],
      expires: json["expires"],
      externalReference: json["external_references"],
      id: json["id"],
      initPoint: json["init_point"],
      internalMetadata: json["internal_metada"],
      marketplace: json["marketplace"],
      marketplaceFee: json["marketplace_fee"],
      metadata: json["metadata"],
      operationType: json["operation_type"],
      items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      payer: Payer.fromJson(json["payer"]),
      paymentMethods: PaymentMethods.fromJson(json["payment_methods"]),
      processingModes: json["processing_modes"],
      redirectUrls: BackUrls.fromJson(json["redirect_urls"]),
      sandboxInitPoint: json["sandbox_init_point"],
      siteId: json["site_id"],
      shipments: Shipments.fromJson(json["shipments"]));

  Map<String, dynamic> toJson() => {
        "additionalInfo": additionalInfo,
        "autoReturn": autoReturn,
        "backUrls": backUrls,
        "binaryMode": binaryMode,
        "clientId": clientId,
        "collectorId": collectorId,
        "couponLabels": couponLabels,
        "couponCode": couponCode,
        "dateCreated": dateCreated,
        "dateOfExpiration": dateOfExpiration,
        "expirationDateFrom": expirationDateFrom,
        "expirationDateTo": expirationDateTo,
        "expires": expires,
        "externalReference": externalReference,
        "id": id,
        "initPoint": initPoint,
        "internalMetadata": internalMetadata,
        "marketplace": marketplace,
        "marketplaceFee": marketplaceFee,
        "metadata": metadata,
        "operationType": operationType,
        "items": items,
        "payer": payer,
        "paymentMethods": paymentMethods,
        "processingModes": processingModes,
        "redirectUrls": redirectUrls,
        "sandboxInitPoint": sandboxInitPoint,
        "siteId": siteId,
        "shipments": shipments
      };
}
