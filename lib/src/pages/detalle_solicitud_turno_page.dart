import 'package:flutter/material.dart';
import 'package:health_safe_paciente/src/providers/detalle_solicitud_turno_provider.dart';
import 'package:provider/provider.dart';
import 'package:health_safe_paciente/src/helpers/functions/extensions.dart';
import 'package:health_safe_paciente/src/pages/models/turno.dart';
import 'package:health_safe_paciente/src/services/autenticacion_service.dart';
import 'package:health_safe_paciente/src/theme/themes.dart';
import 'package:health_safe_paciente/src/widgets/widgets.dart';

class DetalleSolicitudTurnoPage extends StatelessWidget {
  static const String routeName = "DetalleSolicitudTurnoPage";
  const DetalleSolicitudTurnoPage({super.key});

  @override
  Widget build(BuildContext context) {
    Turno turno = ModalRoute.of(context)?.settings.arguments as Turno;

    return SafeArea(
        child: Scaffold(
            appBar: const AppbarCustom(),
            backgroundColor: ColorsApp.celesteFondo,
            body: ChangeNotifierProvider(
              create: (_) => DetalleSolicitudTurnoProvider(),
              child: Column(
                children: [
                  const HeaderPage(title: "Solicitud de turno"),
                  _DetalleTurno(turno: turno),
                  _SolicitarTurnoButton(turno: turno)
                ],
              ),
            ),
            drawer: const DrawerCustom()));
  }
}

class _SolicitarTurnoButton extends StatelessWidget {
  final Turno turno;

  const _SolicitarTurnoButton({Key? key, required this.turno})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final detalleSolicitudTurnoProvider =
        Provider.of<DetalleSolicitudTurnoProvider>(context);

    return ElevatedButtonCustom(
      text: "Solicitar turno",
      margin: EdgeInsets.all(Dimens.dimens40),
      onPressed: () => {}, // TODO Ir a mercado pago
      backgroundColor: Colors.white,
      foregroundColor: Colors.blue,
    );
  }
}

class _DetalleTurno extends StatelessWidget {
  final Turno turno;
  const _DetalleTurno({required this.turno});

  @override
  Widget build(BuildContext context) {
    final autenticacionService =
        Provider.of<AutenticacionService>(context, listen: false);
    final usuario = autenticacionService.usuario;

    final detalleSolicitudTurnoProvider =
        Provider.of<DetalleSolicitudTurnoProvider>(context);

    return Expanded(
      child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(Dimens.dimens10)),
          width: double.infinity,
          margin: EdgeInsets.all(Dimens.dimens20),
          padding: EdgeInsets.all(Dimens.dimens20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const BodyText(text: "Detalles"),
                const Divider(),
                _InformacionDetalleSolicitudTurno(
                    title: "Fecha: ",
                    information: turno.fecha.convertDateTimeToLongFormat()),
                _InformacionDetalleSolicitudTurno(
                    title: "Hora Inicio: ",
                    information: turno.horaInicio.toTimeString()),
                _InformacionDetalleSolicitudTurno(
                    title: "Modalidad: ",
                    information: turno.descripcionModalidadAtencion),
                _InformacionDetalleSolicitudTurno(
                    title: "Profesional: ",
                    information: turno.nombreProfesional),
                _InformacionDetalleSolicitudTurno(
                    title: "Especialidad: ",
                    information: turno.descripcionEspecialidadProfesional),
                _InformacionDetalleSolicitudTurno(
                    title: "Paciente: ",
                    information: "${usuario?.apellido}, ${usuario?.nombre}"),
                SizedBox(height: Dimens.dimens10),
                const DescriptionText(
                    text: "Comentario para el profesional (opcional)",
                    fontWeight: FontWeight.w500),
                SizedBox(height: Dimens.dimens10),
                BasicTextFormField(
                  hintText: "Ingrese aquí sus aclaraciones.",
                  maxLenght: 200,
                  withDescriptionHintText: false,
                  borderColor: Colors.black,
                  maxLines: 5,
                  onChanged: (String value) =>
                      detalleSolicitudTurnoProvider.comentario = value,
                )
              ],
            ),
          )),
    );
  }
}

class _InformacionDetalleSolicitudTurno extends StatelessWidget {
  final String title;
  final String information;
  const _InformacionDetalleSolicitudTurno(
      {required this.title, required this.information});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: Dimens.dimens10),
      child: Row(children: [
        DescriptionText(text: title, fontWeight: FontWeight.w500),
        SizedBox(width: Dimens.dimens10),
        DescriptionText(text: information),
      ]),
    );
  }
}
