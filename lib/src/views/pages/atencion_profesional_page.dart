import 'package:flutter/material.dart';
import 'package:health_safe_paciente/src/models/models.dart';
import 'package:health_safe_paciente/src/theme/themes.dart';
import 'package:health_safe_paciente/src/views/widgets/widgets.dart';

class AtencionProfesionalPage extends StatelessWidget {
  final ProfesionalDto profesional;
  const AtencionProfesionalPage({super.key, required this.profesional});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _ModalidadesAtencionAceptadasAtencion(
              modalidadesAtencion:
                  obtenerModalidadesAtencion(profesional.agendasTurnos)),
          _ConsultoriosAtencion(
              consultorios: obtenerConsultorios(profesional.agendasTurnos)),
          const _PoliticaCancelacionTurnosAtencion()
        ],
      ),
    );
  }

  List<ModalidadAtencionDto> obtenerModalidadesAtencion(
      List<AgendaTurnosDto> agendasTurnos) {
    List<ModalidadAtencionDto> modalidadesAtencion = [];
    List<int> idModalidadesAtencion = [];
    for (var agendaTurnos in agendasTurnos) {
      if (!idModalidadesAtencion.contains(agendaTurnos.modalidadAtencion.id)) {
        modalidadesAtencion.add(agendaTurnos.modalidadAtencion);
        idModalidadesAtencion.add(agendaTurnos.modalidadAtencion.id);
      }
    }
    return modalidadesAtencion;
  }

  List<ConsultorioDto> obtenerConsultorios(
      List<AgendaTurnosDto> agendasTurnos) {
    List<ConsultorioDto> consultorios = [];
    List<int> idConsultorios = [];

    for (var agendaTurnos in agendasTurnos) {
      if (agendaTurnos.modalidadAtencion.descripcion == "Presencial" &&
          agendaTurnos.consultorio != null) {
        if (!idConsultorios.contains(agendaTurnos.consultorio!.id)) {
          consultorios.add(agendaTurnos.consultorio!);
          idConsultorios.add(agendaTurnos.modalidadAtencion.id);
        }
      }
    }
    return consultorios;
  }
}

class _ConsultoriosAtencion extends StatelessWidget {
  const _ConsultoriosAtencion({
    required this.consultorios,
  });

  final List<ConsultorioDto> consultorios;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: EdgeInsets.all(Dimens.dimens10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(Dimens.dimens10)),
        padding: EdgeInsets.all(Dimens.dimens20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DescriptionText(text: "Consultorios"),
            const Divider(),
            if (consultorios.isNotEmpty)
              ...consultorios.map((consultorio) => Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.location_on),
                      SizedBox(width: Dimens.dimens20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (consultorio.descripcion != null) ...[
                            SubdescriptionText(text: consultorio.descripcion!),
                            SizedBox(height: Dimens.dimens10)
                          ] else
                            Container(),
                          SubdescriptionText(
                              text: consultorio.direccion.toString())
                        ],
                      )
                    ],
                  ))
            else
              const SubdescriptionText(text: "No hay consultorios disponibles")
          ],
        ));
  }
}

class _ModalidadesAtencionAceptadasAtencion extends StatelessWidget {
  final List<ModalidadAtencionDto> modalidadesAtencion;

  const _ModalidadesAtencionAceptadasAtencion({
    required this.modalidadesAtencion,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: EdgeInsets.all(Dimens.dimens10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(Dimens.dimens10)),
        padding: EdgeInsets.all(Dimens.dimens20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DescriptionText(text: "Modalidades de atención aceptadas"),
            const Divider(),
            ...modalidadesAtencion.map((modalidadAtencion) =>
                SubdescriptionText(text: modalidadAtencion.toString()))
          ],
        ));
  }
}

class _PoliticaCancelacionTurnosAtencion extends StatelessWidget {
  const _PoliticaCancelacionTurnosAtencion();

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: EdgeInsets.all(Dimens.dimens10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(Dimens.dimens10)),
        padding: EdgeInsets.all(Dimens.dimens20),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DescriptionText(text: "Política de cancelación de turnos"),
            Divider(),
            SubdescriptionText(
                text:
                    "Se permite la cancelación de turno y total reintegración del pago hasta 24 horas antes de la cita médica")
          ],
        ));
  }
}
