import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:health_safe_paciente/src/services/localization/localizacion_service.dart';
import 'package:provider/provider.dart';
import 'package:health_safe_paciente/src/helpers/functions/extensions.dart';
import 'package:health_safe_paciente/src/models/core/core_models.dart';
import 'package:health_safe_paciente/src/services/api/api_services.dart';
import 'package:health_safe_paciente/src/theme/themes.dart';
import 'package:health_safe_paciente/src/views/pages/pages.dart';
import 'package:health_safe_paciente/src/views/widgets/widgets.dart';

class DetalleSolicitudTurnoPage extends StatelessWidget {
  static const String routeName = "DetalleSolicitudTurnoPage";
  const DetalleSolicitudTurnoPage({super.key});

  @override
  Widget build(BuildContext context) {
    TurnoDto turno = ModalRoute.of(context)?.settings.arguments as TurnoDto;

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
  final TurnoDto turno;

  const _SolicitarTurnoButton({Key? key, required this.turno})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButtonCustom(
      text: "Solicitar turno",
      margin: EdgeInsets.all(Dimens.dimens40),
      onPressed: () => Navigator.pushNamed(context, PagoTurnoPage.routeName,
          arguments: turno),
      backgroundColor: Colors.white,
      foregroundColor: Colors.blue,
    );
  }
}

class _DetalleTurno extends StatelessWidget {
  final TurnoDto turno;
  const _DetalleTurno({required this.turno});

  @override
  Widget build(BuildContext context) {
    final autenticacionService =
        Provider.of<AutenticacionApiService>(context, listen: false);
    final usuario = autenticacionService.paciente!.usuario;

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
                    information: turno.fecha.convertDateTimeToLongFormat()),
                InformacionDetalle(
                    title: "Hora Inicio: ",
                    information: turno.horaInicio.toTimeString()),
                InformacionDetalle(
                    title: "Modalidad: ",
                    information:
                        turno.agendaTurnos?.modalidadAtencion.descripcion),
                InformacionDetalle(
                    title: "Profesional: ",
                    information: turno.agendaTurnos?.profesional.toString()),
                InformacionDetalle(
                    title: "Especialidad: ",
                    information: turno.especialidad.descripcion),
                if (turno.agendaTurnos?.consultorio != null)
                  _Consultorio(consultorio: turno.agendaTurnos!.consultorio!),
                InformacionDetalle(
                    title: "Paciente: ",
                    information: "${usuario.apellido}, ${usuario.nombre}"),
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
            information: consultorio.direccion.toLongString()),
        FutureBuilder(
            future: LocalizacionService()
                .obtenerLatitudLongitud(consultorio.direccion),
            builder: (BuildContext context, AsyncSnapshot<LatLng?> snapshot) {
              if (snapshot.hasError) {
                // TODO Mensaje de error no se pudo encontrar la ubicacion
              }

              if (snapshot.hasData) {
                if (snapshot.data != null) {
                  return GoogleMapCustom(
                      coordenadasDestino: snapshot.data!,
                      destino: consultorio.direccion.toString());
                } else {
                  // TODO Mensaje de error no hay lat y lng
                }
              }
              return const CircularProgressIndicator();
            }),
      ],
    );
  }
}
