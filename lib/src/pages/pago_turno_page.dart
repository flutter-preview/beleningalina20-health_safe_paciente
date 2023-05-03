import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:mercadopago_sdk/mercadopago_sdk.dart';
import 'package:health_safe_paciente/src/helpers/functions/extensions.dart';
import 'package:health_safe_paciente/src/pages/pages.dart';
import 'package:health_safe_paciente/src/pages/models/mercado_pago/payments.dart';
import 'package:health_safe_paciente/src/pages/models/turno.dart';
import 'package:health_safe_paciente/src/services/services.dart';
import 'package:health_safe_paciente/src/theme/colors_app.dart';
import 'package:health_safe_paciente/src/theme/dimens.dart';
import 'package:health_safe_paciente/src/widgets/widgets.dart';

class PagoTurnoPage extends StatefulWidget {
  static const String routeName = "PagoTurnoPage";
  const PagoTurnoPage({super.key});

  @override
  State<PagoTurnoPage> createState() => _PagoTurnoPageState();
}

class _PagoTurnoPageState extends State<PagoTurnoPage> {
  bool cargandoRedireccionMercadoPago = false;

  late Turno turno;

  @override
  void initState() {
    setState(() => cargandoRedireccionMercadoPago = false);

    procesandoRespuestaMercadoPago();

    super.initState();
  }

  void procesandoRespuestaMercadoPago() {
    const channelMercadoPagoRespuesta =
        MethodChannel("health_safe/mercado_pago_response");
    channelMercadoPagoRespuesta.setMethodCallHandler((MethodCall call) async {
      switch (call.method) {
        case "mercadoPagoOK":
          String paymentId = call.arguments[0];
          String status = call.arguments[1];
          String statusDetail = call.arguments[2];

          switch (status) {
            case "pending": // statusDetail: pending_contingency, pending_review_manual, pending_waiting_payment, pending_waiting_transfer, pending_waiting_released
            case "authorized":
            case "in_process": // statusDetail: pending_review_manual, pending_contingency
            case "in_meditiation":
            case "rejected": // statusDetail: cc_rejected_insufficient_amount, cc_rejected_other_reason, cc_rejected_high_risk, cc_rejected_bad_filled_card_number, cc_rejected_bad_filled_date, cc_rejected_bad_filled_other, cc_rejected_bad_filled_security_code, cc_rejected_blacklist, cc_rejected_call_for_authorize, cc_rejected_card_disabled, cc_rejected_card_error, cc_rejected_duplicated_payment, cc_rejected_invalid_installments, cc_rejected_max_attempts
            case "cancelled":
            case "refunded":
            case "charged_back":
              // TODO Manejar cada tipo de error
              return showSnackBar(
                  context, "Error en el procesamiento del pago");

            case "approved":
              if (statusDetail == "accredited") {
                TurnoService turnoService = TurnoService();

                final autenticacionService =
                    Provider.of<AutenticacionService>(context, listen: false);
                final usuario = autenticacionService.usuario;

                await turnoService
                    .crearTurno({
                      "idpago": paymentId,
                      "idagendaturno": turno.idAgendaTurnos.toString(),
                      "idusuario": usuario?.id.toString() ?? "",
                      "horainicio": turno.horaInicio.toTimeString(),
                      "horaFin": turno.horaFin.toTimeString(),
                      "fecha": turno.fecha.toString(),
                      "idEspecialidad": turno.idEspecialidad.toString()
                    })
                    .then((value) => showDialogCustom(
                        context,
                        [
                          const DescriptionText(
                              text: "Pago exitoso",
                              color: Colors.green,
                              fontWeight: FontWeight.bold),
                          SizedBox(
                            height: Dimens.dimens10,
                          ),
                          const Icon(Icons.verified, color: Colors.green)
                        ],
                        barrierDismissible: false,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        onAccept: () => Navigator.pushNamedAndRemoveUntil(
                            context, HomePage.routeName, (route) => false)))
                    .onError((error, _) => showDialogCustom(
                        context,
                        [
                          const DescriptionText(
                              text: "No se pudo procesar el pago",
                              fontWeight: FontWeight.bold),
                          SizedBox(
                            height: Dimens.dimens10,
                          ),
                          const Icon(Icons.error, color: Colors.orange)
                        ],
                        barrierDismissible: false,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        onAccept: () => Navigator.pushNamedAndRemoveUntil(
                            context, HomePage.routeName, (route) => false)));
              } else {
                throw (Exception(
                    "Este status de pago no esta considerado ${call.arguments[0]}"));
              }
              break;

            default:
              throw (Exception(
                  "Este status de pago no esta considerado ${call.arguments[0]}"));
          }
          break;

        case "mercadoPagoFailed":
          showSnackBar(context, "Se canceló la operación con Mercado Pago");
          break;

        case "mercadoPagoCanceled":
          showSnackBar(context, "Se canceló el pago mediante Mercado Pago");

          break;
        default:
          showSnackBar(context,
              "Problemas con el servidor. Comuniquese con el administrador");
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    turno = ModalRoute.of(context)?.settings.arguments as Turno;

    return SafeArea(
        child: Scaffold(
            body: _GradienteContainer(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                  _DescriptionPago(turno: turno),
                  if (cargandoRedireccionMercadoPago)
                    const CircularProgressIndicator(),
                  _AccionesPagarTurno(
                      updateMercadoPagoState: (bool value) => setState(
                          () => cargandoRedireccionMercadoPago = value),
                      turno: turno),
                ])),
            drawer: const DrawerCustom(),
            appBar: const AppbarCustom()));
  }
}

class _GradienteContainer extends StatelessWidget {
  final Widget child;
  const _GradienteContainer({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Dimens.dimens20),
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [ColorsApp.celesteMercadoPago, Colors.white],
              stops: [0.5, 0.45],
              tileMode: TileMode.repeated,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)),
      child: child,
    );
  }
}

class _DescriptionPago extends StatelessWidget {
  final Turno turno;
  const _DescriptionPago({Key? key, required this.turno}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const BodyText(text: "Detalle", decoration: TextDecoration.underline),
        SizedBox(height: Dimens.dimens10),
        DescriptionText(
            text:
                "${turno.nombreProfesional} - ${turno.descripcionEspecialidadProfesional}",
            textAlign: TextAlign.center),
        SizedBox(height: Dimens.dimens10),
        DescriptionText(
            text:
                "${turno.fecha.convertDateTimeToLongFormat()} - ${turno.horaInicio.toTimeString()}",
            textAlign: TextAlign.center),
        SizedBox(height: Dimens.dimens10),
        DescriptionText(
            text: "Precio: \$ ${turno.precio}", fontWeight: FontWeight.bold),
        SizedBox(height: Dimens.dimens10),
        Image(
            image: const AssetImage("assets/imgs/mercado_pago.jpg"),
            height: Dimens.dimens250,
            width: double.infinity)
      ],
    );
  }
}

class _AccionesPagarTurno extends StatelessWidget {
  final void Function(bool) updateMercadoPagoState;
  final Turno turno;

  const _AccionesPagarTurno(
      {Key? key, required this.updateMercadoPagoState, required this.turno})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
        child: ElevatedButtonCustom(
            text: "Cancelar",
            expanded: false,
            foregroundColor: Colors.white,
            backgroundColor: ColorsApp.rojoAsistenciaInmediata,
            onPressed: () => Navigator.popUntil(
                context, ModalRoute.withName(PerfilProfesionalPage.routeName))),
      ),
      SizedBox(width: Dimens.dimens10),
      Expanded(
        child: ElevatedButtonCustom(
            expanded: false,
            text: "Continuar",
            foregroundColor: Colors.white,
            backgroundColor: ColorsApp.azulBusqueda,
            onPressed: () => ejecutarMercadoPago(context)),
      ),
    ]);
  }

  void ejecutarMercadoPago(BuildContext context) async {
    updateMercadoPagoState(true);

    final autenticacionService =
        Provider.of<AutenticacionService>(context, listen: false);
    final usuario = autenticacionService.usuario;

    final mercadoPago = MP(MercadoPagoCredentials.mpClientIdPROD,
        MercadoPagoCredentials.mpClientSecretPROD);

    Preference preference = Preference(
        items: [
          Item(
              title:
                  " ${turno.nombreProfesional} (${turno.descripcionEspecialidadProfesional}) ${turno.fecha.convertDateTimeToLongFormat()} - ${turno.horaInicio.toTimeString()}",
              quantity: 1,
              unitPrice: turno.precio,
              currencyId: "ARS")
        ],
        payer: Payer(
            name: usuario?.nombre ?? "",
            surname: usuario?.apellido ?? "",
            email: usuario?.correo ?? ""),
        paymentMethods: PaymentMethods(excludedPaymentTypes: [
          ExcludedPayment(id: 'ticket')
        ], excludedPaymentMethods: [
          ExcludedPayment(id: 'rapipago'),
          ExcludedPayment(id: 'pagofacil')
        ]));

    try {
      var result = await mercadoPago
          .createPreference(preference.toJson())
          .whenComplete(() => updateMercadoPagoState(false));
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
