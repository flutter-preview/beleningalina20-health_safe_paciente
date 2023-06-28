import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;
import 'package:health_safe_paciente/src/extensions/extensions.dart';
import 'package:health_safe_paciente/src/models/models.dart';
import 'package:health_safe_paciente/src/services/localization/localizacion_service.dart';
import 'package:health_safe_paciente/src/theme/themes.dart';
import 'package:health_safe_paciente/src/views/pages/pages.dart';
import 'package:health_safe_paciente/src/views/widgets/widgets.dart';

class DetalleTurnoPage extends StatelessWidget {
  static const String routeName = "DetalleTurnoPage";

  const DetalleTurnoPage({super.key});

  @override
  Widget build(BuildContext context) {
    TurnoPacienteDto turno =
        ModalRoute.of(context)?.settings.arguments as TurnoPacienteDto;

    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorsApp.celesteFondo,
        body: Column(
          children: [
            HeaderPage(
                title:
                    "Mis turnos - ${turno.fecha.convertToString(longFormat: true)}"),
            Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(Dimens.dimens10)),
                width: double.infinity,
                margin: EdgeInsets.symmetric(
                    vertical: Dimens.dimens20, horizontal: Dimens.dimens10),
                padding: EdgeInsets.all(Dimens.dimens20),
                child: _InfoTurno(turno: turno))
          ],
        ),
        drawer: const DrawerCustom(),
        appBar: const AppbarCustom(),
      ),
    );
  }
}

class _InfoTurno extends StatelessWidget {
  const _InfoTurno({
    Key? key,
    required this.turno,
  }) : super(key: key);

  final TurnoPacienteDto turno;

  @override
  Widget build(BuildContext context) {
    DateTime inicioTurno = DateTime(turno.fecha.year, turno.fecha.month,
        turno.fecha.month, turno.horaInicio.hour, turno.horaInicio.minute);
    DateTime finTurno = DateTime(turno.fecha.year, turno.fecha.month,
        turno.fecha.month, turno.horaFin.hour, turno.horaFin.minute);

    return Column(children: [
      InfoProfesionalCard(profesional: turno.profesional),
      InformacionDetalle(
          title: "Hora: ", information: turno.horaInicio.convertToString()),
      InformacionDetalle(
          title: "Modalidad: ",
          information: turno.modalidadAtencion.descripcion),
      InformacionDetalle(
          title: "Especialidad: ", information: turno.especialidad.descripcion),
      InformacionDetalle(
          title: "Precio: ", information: "\$${turno.precio.toString()}"),
      if (turno.modalidadAtencion.descripcion == "Presencial" ||
          turno.consultorio != null)
        _ConsultorioAgendaTurnos(consultorio: turno.consultorio!),
      SizedBox(height: Dimens.dimens10),
      if (DateTime.now().isBefore(inicioTurno))
        const _AccionesTurnoReservado()
      else if (DateTime.now().isAfter(finTurno))
        const _AccionesTurnoFinalizado()
      else
        _LinkVideollamadaButton(turno: turno)
    ]);
  }
}

class _ConsultorioAgendaTurnos extends StatelessWidget {
  final ConsultorioDto consultorio;
  const _ConsultorioAgendaTurnos({Key? key, required this.consultorio})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InformacionDetalle(
            title: "Consultorio: ",
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

class _LinkVideollamadaButton extends StatelessWidget {
  final TurnoPacienteDto turno;
  const _LinkVideollamadaButton({required this.turno});

  @override
  Widget build(BuildContext context) {
    DateTime inicioTurno = DateTime(turno.fecha.year, turno.fecha.month,
        turno.fecha.month, turno.horaInicio.hour, turno.horaInicio.minute);
    DateTime finTurno = DateTime(turno.fecha.year, turno.fecha.month,
        turno.fecha.month, turno.horaFin.hour, turno.horaFin.minute);
    if (DateTime.now().isAfter(inicioTurno) &&
        DateTime.now().isBefore(finTurno)) {
      return TextButtonCustom(
          text: "Unirse a la videollamada",
          foregroundColor: Colors.blue,
          onPressed: () => Navigator.pushNamed(
              context, VideollamadaPage.routeName,
              arguments: turno));
    } else {
      return Container();
    }
  }
}

class _AccionesTurnoReservado extends StatelessWidget {
  const _AccionesTurnoReservado();

  @override
  Widget build(BuildContext context) {
    // TODO La cancelacion solo esta disponible hasta un dia antes de la fecha de turno
    return ElevatedButtonCustom(
        text: "Cancelar turno",
        expanded: true,
        foregroundColor: Colors.white,
        backgroundColor: ColorsApp.rojoAsistenciaInmediata,
        onPressed: () =>
            {} // TODO Cancelacion turno -> reintegro de todo el dinero.
        );
  }
}

class _AccionesTurnoFinalizado extends StatelessWidget {
  const _AccionesTurnoFinalizado();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const DescriptionText(
          text: "Archivos adjuntos",
          fontWeight: FontWeight.bold,
          textAlign: TextAlign.start,
        ),
        SizedBox(height: Dimens.dimens10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButtonText(
                icon: Icons.receipt,
                title: "Prescripción\nmédica",
                onTap: () => {} // TODO Ir Prescripion/es Medica/s
                ),
            IconButtonText(
                icon: Icons.mode_edit_outline_sharp,
                title: "Indicación\nmedica",
                onTap: () => {} // TODO Ir Indicación/es Médica/s
                ),
            IconButtonText(
                icon: Icons.folder,
                title: "Historia\nClínica",
                onTap: () =>
                    {} // TODO Ir a Historia clinica (los registros que hizo este profesional)
                )
          ],
        )
      ],
    );
  }
}
