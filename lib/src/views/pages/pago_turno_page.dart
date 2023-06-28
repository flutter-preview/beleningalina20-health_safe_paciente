import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:health_safe_paciente/src/models/models.dart';
import 'package:provider/provider.dart';
import 'package:health_safe_paciente/src/views/pages/models/turno.dart';
import 'package:health_safe_paciente/src/extensions/extensions.dart';
import 'package:health_safe_paciente/src/services/api/api.dart';
import 'package:health_safe_paciente/src/services/api/models/models.dart';
import 'package:health_safe_paciente/src/services/mercado_pago/mercado_pago_service.dart';
import 'package:health_safe_paciente/src/services/mercado_pago/models/models.dart';
import 'package:health_safe_paciente/src/views/pages/pages.dart';
import 'package:health_safe_paciente/src/theme/colors_app.dart';
import 'package:health_safe_paciente/src/theme/dimens.dart';
import 'package:health_safe_paciente/src/views/widgets/widgets.dart';

class PagoTurnoPage extends StatefulWidget {
  static const String routeName = "PagoTurnoPage";
  const PagoTurnoPage({super.key});

  @override
  State<PagoTurnoPage> createState() => _PagoTurnoPageState();
}

class _PagoTurnoPageState extends State<PagoTurnoPage> {
  bool cargandoRedireccionMercadoPago = false;

  late TurnoModel turno;

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
            case "approved":
              if (statusDetail == "accredited") {
                final autenticacionService =
                    Provider.of<AutenticacionService>(context, listen: false);
                turno.idPago = paymentId;
                PacienteDto paciente = await PacienteService()
                    .obtenerPaciente(autenticacionService.usuario?.id ?? 0);
                int idPaciente = paciente.id;

                CrearTurnoRequest request = CrearTurnoRequest(
                    fecha: turno.fecha,
                    horaInicio: turno.horaInicio,
                    horaFin: turno.horaFin,
                    idAgendaTurnos: turno.idAgendaTurnos,
                    idPagoMercadoPago: turno.idPago!,
                    idPaciente: idPaciente,
                    idEspecialidad: turno.especialidad.id,
                    idProfesional: turno.profesional.id);

                await TurnoService().crearTurno(request).then((value) {
                  showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) => AlertDialogBackground(
                              onAccept: () => Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  HomePage.routeName,
                                  (route) => false),
                              content: const [
                                MessageState(
                                    text: "Pago Exitoso",
                                    iconState: SuccessIcon())
                              ]));
                }).onError((error, _) {
                  errorPago();
                }).whenComplete(() =>
                    setState(() => cargandoRedireccionMercadoPago = false));
              } else {
                setState(() => cargandoRedireccionMercadoPago = false);
                return errorPago();
              }
              break;

            default:
              setState(() => cargandoRedireccionMercadoPago = false);
              return errorPago();
          }
          break;

        case "mercadoPagoFailed":
          setState(() => cargandoRedireccionMercadoPago = false);
          return errorPago();

        case "mercadoPagoCanceled":
          setState(() => cargandoRedireccionMercadoPago = false);
          return showDialog(
              context: context,
              builder: (context) => const AlertDialogBackground(content: [
                    MessageState(
                        text: "Pago cancelado", iconState: FailureIcon())
                  ]));

        default:
          setState(() => cargandoRedireccionMercadoPago = false);
          return errorPago();
      }
    });
  }

  void errorPago() {
    showDialog(
        context: context,
        builder: (context) => const AlertDialogBackground(content: [
              MessageState(
                  text: "Error al procesar tu pago. Inténtalo más tarde.",
                  iconState: FailureIcon())
            ]));
  }

  @override
  Widget build(BuildContext context) {
    turno = ModalRoute.of(context)?.settings.arguments as TurnoModel;

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
  final TurnoModel turno;
  const _DescriptionPago({Key? key, required this.turno}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const BodyText(text: "Detalle", decoration: TextDecoration.underline),
        SizedBox(height: Dimens.dimens10),
        DescriptionText(
            text: "${turno.profesional} - ${turno.especialidad.descripcion}",
            textAlign: TextAlign.center),
        SizedBox(height: Dimens.dimens10),
        DescriptionText(
            text:
                "${turno.fecha.convertToString(longFormat: true)} - ${turno.horaInicio.convertToString()}",
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
  final TurnoModel turno;

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

    Preference preference = Preference(
        items: [
          Item(
              title:
                  " ${turno.profesional} (${turno.especialidad.descripcion}) ${turno.fecha.convertToString()} - ${turno.horaInicio.convertToString()}",
              quantity: 1,
              unitPrice: turno.precio,
              currencyId: "ARS")
        ],
        payer: Payer(
            name: usuario?.nombre ?? '',
            surname: usuario?.apellido ?? '',
            email: usuario?.correo ?? ''),
        paymentMethods: PaymentMethods(excludedPaymentTypes: [
          ExcludedPayment(id: 'ticket')
        ], excludedPaymentMethods: [
          ExcludedPayment(id: 'rapipago'),
          ExcludedPayment(id: 'pagofacil')
        ]));

    await MercadoPagoService()
        .pagarTurno(preference)
        .then((value) => updateMercadoPagoState(false))
        .onError((error, stackTrace) => updateMercadoPagoState(false))
        .whenComplete(() => updateMercadoPagoState(false));
  }
}
