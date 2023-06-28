import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:health_safe_paciente/src/views/pages/models/models.dart';
import 'package:health_safe_paciente/src/extensions/extensions.dart';
import 'package:health_safe_paciente/src/models/models.dart';
import 'package:health_safe_paciente/src/services/localization/localizacion_service.dart';
import 'package:health_safe_paciente/src/services/api/api.dart';
import 'package:health_safe_paciente/src/theme/themes.dart';
import 'package:health_safe_paciente/src/views/pages/pages.dart';
import 'package:health_safe_paciente/src/views/widgets/widgets.dart';

class DetalleSolicitudTurnoPage extends StatelessWidget {
  static const String routeName = "DetalleSolicitudTurnoPage";
  const DetalleSolicitudTurnoPage({super.key});

  @override
  Widget build(BuildContext context) {
    TurnoModel turno = ModalRoute.of(context)?.settings.arguments as TurnoModel;

    return SafeArea(
        child: Scaffold(
            appBar: const AppbarCustom(),
            backgroundColor: ColorsApp.celesteFondo,
            body: Column(
              children: [
                const HeaderPage(title: "Solicitud de turno"),
                _DetalleTurno(turno: turno),
                _SolicitarTurnoButton(turno: turno)
              ],
            ),
            drawer: const DrawerCustom()));
  }
}

class _SolicitarTurnoButton extends StatelessWidget {
  final TurnoModel turno;

  const _SolicitarTurnoButton({Key? key, required this.turno})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButtonCustom(
      text: "Solicitar turno",
      margin: EdgeInsets.all(Dimens.dimens20),
      onPressed: () => Navigator.pushNamed(context, PagoTurnoPage.routeName,
          arguments: turno),
      backgroundColor: Colors.white,
      foregroundColor: Colors.blue,
    );
  }
}

class _DetalleTurno extends StatelessWidget {
  final TurnoModel turno;
  const _DetalleTurno({required this.turno});

  @override
  Widget build(BuildContext context) {
    final autenticacionService =
        Provider.of<AutenticacionService>(context, listen: false);
    final usuario = autenticacionService.usuario;

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
                InformacionDetalle(
                    title: "Fecha: ",
                    information: turno.fecha.convertToString(longFormat: true)),
                InformacionDetalle(
                    title: "Hora Inicio: ",
                    information: turno.horaInicio.convertToString()),
                InformacionDetalle(
                    title: "Modalidad: ",
                    information: turno.modalidadAtencion.toString()),
                InformacionDetalle(
                    title: "Profesional: ",
                    information: turno.profesional.toString()),
                InformacionDetalle(
                    title: "Especialidad: ",
                    information: turno.especialidad.toString()),
                if (turno.consultorio != null)
                  _Consultorio(consultorio: turno.consultorio!),
                InformacionDetalle(
                    title: "Paciente: ", information: usuario.toString()),
              ],
            ),
          )),
    );
  }
}

class _Consultorio extends StatelessWidget {
  final ConsultorioDto consultorio;
  const _Consultorio({required this.consultorio});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InformacionDetalle(
            title: "Consultorio",
            information: consultorio.direccion.toString()),
        FutureStatesBuilder<LatLng>(
          future: LocalizacionService()
              .obtenerLatitudLongitud(consultorio.direccion),
          onError: () => const MessageState(
              text:
                  "Algo salió mal al cargar el mapa y la ubicacion del consultorio. Inténtalo más tarde.",
              iconState: FailureIcon()),
          onSuccess: (value) => GoogleMapCustom(
              coordenadasDestino: value,
              destino: consultorio.direccion.toString()),
          onNull: () => const MessageState(
              text:
                  "Algo salió mal al cargar el mapa y la ubicacion del consultorio. Inténtalo más tarde.",
              iconState: FailureIcon()),
        ),
      ],
    );
  }
}
