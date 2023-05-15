import 'package:flutter/material.dart';
import 'package:health_safe_paciente/src/models/core/core_models.dart';
import 'package:provider/provider.dart';
import 'package:health_safe_paciente/src/views/pages/pages.dart';
import 'package:health_safe_paciente/src/helpers/functions/extensions.dart';
import 'package:health_safe_paciente/src/providers/perfil_profesional_provider.dart';
import 'package:health_safe_paciente/src/theme/themes.dart';
import 'package:health_safe_paciente/src/views/widgets/widgets.dart';

class TurnosProfesionalPage extends StatelessWidget {
  final ProfesionalDto profesional;
  final EspecialidadDto especialidad;
  const TurnosProfesionalPage(
      {super.key, required this.profesional, required this.especialidad});

  @override
  Widget build(BuildContext context) {
    final perfilProfesionalProvider =
        Provider.of<PerfilProfesionalProvider>(context);

    if (profesional.agendasTurnos.isEmpty) {
      // TODO return No hay agendas de turnos del profesional
    }

    return Flexible(
      child: Column(
        children: [
          Container(
              padding: EdgeInsets.all(Dimens.dimens20),
              color: ColorsApp.azulBusqueda,
              child: const SubdescriptionText(
                text:
                    "A continuación seleccione la modalidad de atencion y fecha en la  que desea solicitar un turno con el profesional. Recuerde que los turnos disponibles se encuentran en color azul, mientras que los turnos ocupados en color amarillo.",
                textAlign: TextAlign.center,
                color: Colors.white,
                fontWeight: FontWeight.w300,
              )),
          Expanded(
            child: Container(
                margin: EdgeInsets.all(Dimens.dimens10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(Dimens.dimens10)),
                padding: EdgeInsets.all(Dimens.dimens20),
                child: Column(children: [
                  fechasDisponibles(context),
                  const Divider(),
                  modalidadesAtencionDisponiblesPorFecha(context),
                  consultoriosDisponiblesPorFecha(context),

                  SizedBox(height: Dimens.dimens20),

                  (perfilProfesionalProvider.consultaTurnosValido())
                      ? _TurnosProfesionalDisponibles(
                          profesional: profesional, especialidad: especialidad)
                      : Container() // TODO mensaje seleccionar fecha, modalidad y consultorio
                ])),
          )
        ],
      ),
    );
  }

  Widget fechasDisponibles(BuildContext context) {
    final perfilProfesionalProvider =
        Provider.of<PerfilProfesionalProvider>(context, listen: false);

    return DateTimePicker(
        fechas: perfilProfesionalProvider
            .fechasDisponibles(profesional.agendasTurnos),
        fechaSeleccionada:
            perfilProfesionalProvider.fechaAgendaTurnosSeleccionada ??
                profesional.agendasTurnos.first.fechaDesde,
        onChanged: (DateTime value) {
          perfilProfesionalProvider.fechaAgendaTurnosSeleccionada = value;
          perfilProfesionalProvider.modalidadAtencionSeleccionada = null;
          perfilProfesionalProvider.consultorioSeleccionado = null;
        });
  }

  Widget modalidadesAtencionDisponiblesPorFecha(BuildContext context) {
    final perfilProfesionalProvider =
        Provider.of<PerfilProfesionalProvider>(context, listen: false);

    return DropDownButtonCustom<ModalidadAtencionDto>(
      vertical: false,
      label: 'Modalidad',
      borderColor: Colors.grey,
      labelColor: Colors.black,
      items: perfilProfesionalProvider.modalidadesAtencionDisponible(profesional
          .agendasTurnos
          .where((agendaTurnos) =>
              perfilProfesionalProvider.fechaPerteneceAgendaTurnos(
                  agendaTurnos.fechaDesde, agendaTurnos.fechaHasta))
          .toList()),
      value: perfilProfesionalProvider.modalidadAtencionSeleccionada,
      onChanged: (value) {
        perfilProfesionalProvider.modalidadAtencionSeleccionada = value;
        perfilProfesionalProvider.consultorioSeleccionado = null;
      },
    );
  }

  Widget consultoriosDisponiblesPorFecha(BuildContext context) {
    final perfilProfesionalProvider =
        Provider.of<PerfilProfesionalProvider>(context, listen: false);

    if (perfilProfesionalProvider.modalidadAtencionSeleccionada?.descripcion ==
        "Presencial") {
      return Column(
        children: [
          const Divider(),
          DropDownButtonCustom<ConsultorioDto>(
            vertical: false,
            label: 'Consultorio',
            borderColor: Colors.grey,
            labelColor: Colors.black,
            items: perfilProfesionalProvider.consultoriosDisponibles(profesional
                .agendasTurnos
                .where((agendaTurnos) =>
                    perfilProfesionalProvider.fechaPerteneceAgendaTurnos(
                        agendaTurnos.fechaDesde, agendaTurnos.fechaHasta) &&
                    agendaTurnos.modalidadAtencion.descripcion ==
                        perfilProfesionalProvider
                            .modalidadAtencionSeleccionada?.descripcion)
                .toList()),
            value: perfilProfesionalProvider.consultorioSeleccionado,
            onChanged: (value) =>
                perfilProfesionalProvider.consultorioSeleccionado = value,
          ),
        ],
      );
    } else {
      return Container();
    }
  }
}

class _TurnosProfesionalDisponibles extends StatelessWidget {
  final ProfesionalDto profesional;
  final EspecialidadDto especialidad;
  const _TurnosProfesionalDisponibles(
      {required this.profesional, required this.especialidad});

  @override
  Widget build(BuildContext context) {
    final perfilProfesionalProvider =
        Provider.of<PerfilProfesionalProvider>(context);

    List<TurnoDto> turnos = [];

    List<AgendaTurnosDto> agendasTurnos = profesional.agendasTurnos
        .where((agendaTurnos) =>
            perfilProfesionalProvider.fechaPerteneceAgendaTurnos(
                agendaTurnos.fechaDesde, agendaTurnos.fechaHasta) &&
            agendaTurnos.modalidadAtencion.id ==
                perfilProfesionalProvider.modalidadAtencionSeleccionada?.id &&
            agendaTurnos.consultorio?.id ==
                perfilProfesionalProvider.consultorioSeleccionado?.id)
        .toList();

    for (var agendaTurnos in agendasTurnos) {
      TimeOfDay horaInicioTurnoAux = agendaTurnos.horaInicio;

      while (!horaInicioTurnoAux.isEquals(agendaTurnos.horaFin)) {
        TimeOfDay horaFinTurno =
            horaInicioTurnoAux.add(Duration(minutes: agendaTurnos.duracion));

        TurnoDto turnoProfesional = TurnoDto(
            fecha: perfilProfesionalProvider.fechaAgendaTurnosSeleccionada!,
            horaInicio: horaInicioTurnoAux,
            horaFin: horaFinTurno,
            especialidad: especialidad,
            agendaTurnos: agendaTurnos,
            disponible: agendaTurnos.turnosReservados
                .where((turno) =>
                    turno.fecha ==
                        perfilProfesionalProvider
                            .fechaAgendaTurnosSeleccionada &&
                    turno.horaInicio.isEquals(horaInicioTurnoAux) &&
                    turno.horaFin.isEquals(horaFinTurno))
                .toList()
                .isEmpty);
        turnos.add(turnoProfesional);

        horaInicioTurnoAux = horaFinTurno;
      }
    }

    List<TableRow> rows = [];
    int rowsCount = (turnos.length / 4).round();

    for (int i = 0; i <= rowsCount - 1; i++) {
      if (turnos.length >= 4) {
        rows.add(TableRow(
            children: turnos
                .getRange(0, 4)
                .map((turno) => _TurnoContainer(turno: turno))
                .toList()));
        turnos.removeRange(0, 4);
      } else {
        List<Widget> children =
            turnos.map((turno) => _TurnoContainer(turno: turno)).toList();
        for (int i = 0; i < (4 - turnos.length); i++) {
          children.add(const _TurnoContainer());
        }
        rows.add(TableRow(children: children));
        turnos.clear();
      }
    }

    return Expanded(
      child: SingleChildScrollView(
        child: Table(children: rows),
      ),
    );
  }
}

class _TurnoContainer extends StatelessWidget {
  final TurnoDto? turno;
  final ProfesionalDto? profesional;

  const _TurnoContainer({this.turno, this.profesional});

  @override
  Widget build(BuildContext context) {
    if (turno != null) {
      return InkWell(
        onTap: (turno!.disponible)
            ? () {
                turno?.agendaTurnos?.profesional = profesional;
                Navigator.pushNamed(
                    context, DetalleSolicitudTurnoPage.routeName,
                    arguments: turno);
              }
            : null,
        child: Container(
            margin: EdgeInsets.all(Dimens.dimens10),
            decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.all(Radius.circular(Dimens.dimens10)),
                color: (turno!.disponible)
                    ? ColorsApp.azulBusqueda
                    : ColorsApp.amarilloLibre),
            padding: EdgeInsets.all(Dimens.dimens10),
            child: Column(
              children: [
                Text(turno!.horaInicio.toTimeString(),
                    style: const TextStyle(color: Colors.white)),
                Text("\$${turno!.agendaTurnos!.precio}",
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold))
              ],
            )),
      );
    } else {
      return Container();
    }
  }
}
