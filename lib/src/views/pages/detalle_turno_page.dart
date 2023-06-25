import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;
import 'package:health_safe_paciente/src/extensions/extensions.dart';
import 'package:health_safe_paciente/src/models/models.dart';
import 'package:health_safe_paciente/src/services/localization/localizacion_service.dart';
import 'package:health_safe_paciente/src/theme/themes.dart';
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
                child: (turno.agendaTurnos.profesional != null)
                    ? _InfoTurno(turno: turno)
                    : Container() // TODO Mensaje de error. No hay profesional,
                )
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
    return Column(children: [
      InfoProfesionalCard(profesional: turno.agendaTurnos.profesional!),
      InformacionDetalle(
          title: "Hora: ", information: turno.horaInicio.convertToString()),
      InformacionDetalle(
          title: "Modalidad: ",
          information: turno.agendaTurnos.modalidadAtencion.descripcion),
      InformacionDetalle(
          title: "Especialidad: ", information: turno.especialidad.descripcion),
      InformacionDetalle(
          title: "Precio: ",
          information: "\$${turno.agendaTurnos.precio.toString()}"),
      if (turno.agendaTurnos.modalidadAtencion.descripcion == "Presencial" ||
          turno.agendaTurnos.consultorio != null)
        _ConsultorioAgendaTurnos(consultorio: turno.agendaTurnos.consultorio!)
      else
        _LinkVideollamadaButton(
            fechaTurno: turno.fecha,
            idProfesional: turno.agendaTurnos.profesional?.id),
      SizedBox(height: Dimens.dimens10),
      if (turno.fecha.isAfter(DateTime.now()))
        const _AccionesTurnoReservado()
      else
        const _AccionesTurnoFinalizado()
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
  final DateTime fechaTurno;
  final int? idProfesional;
  const _LinkVideollamadaButton({required this.fechaTurno, this.idProfesional});

  @override
  Widget build(BuildContext context) {
    if (fechaTurno.isAfter(DateTime.now()) && idProfesional != null) {
      return TextButtonCustom(
          text: "Unirse a la videollamada",
          foregroundColor: Colors.blue,
          onPressed: () => {} // TODO Unirse a la videollamada.
          );
    } else {
      return Container();
    }
  }
}

class _AccionesTurnoReservado extends StatelessWidget {
  const _AccionesTurnoReservado();

  @override
  Widget build(BuildContext context) {
    return ElevatedButtonCustom(
        text: "Cancelar turno",
        expanded: true,
        foregroundColor: Colors.white,
        backgroundColor: ColorsApp.rojoAsistenciaInmediata,
        onPressed: () => {} // TODO Cancelacion turno.
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
