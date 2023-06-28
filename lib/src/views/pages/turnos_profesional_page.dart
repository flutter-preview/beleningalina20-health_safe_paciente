import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:health_safe_paciente/src/extensions/extensions.dart';
import 'package:health_safe_paciente/src/models/models.dart';
import 'package:health_safe_paciente/src/theme/themes.dart';
import 'package:health_safe_paciente/src/views/pages/models/models.dart';
import 'package:health_safe_paciente/src/views/pages/pages.dart';
import 'package:health_safe_paciente/src/views/providers/providers.dart';
import 'package:health_safe_paciente/src/views/widgets/widgets.dart';

class TurnosProfesionalPage extends StatelessWidget {
  final ProfesionalDto profesional;
  final EspecialidadDto especialidad;
  const TurnosProfesionalPage(
      {super.key, required this.profesional, required this.especialidad});

  @override
  Widget build(BuildContext context) {
    if (profesional.agendasTurnos.isEmpty) {
      return const MessageState(
          text: "El profesional no tiene agendas de turnos creadas",
          iconState: EmptyIcon());
    }

    return Flexible(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(Dimens.dimens20),
            color: ColorsApp.azulBusqueda,
            width: double.infinity,
            child: Text.rich(
              TextSpan(
                  text:
                      "A continuacion, seleccione la modalidad de atencion del turno que desea solicitar para consultar los turnos del profesional. Recuerde que los turnos disponibles se encuentran en color ",
                  style:
                      TextStyle(fontSize: Dimens.dimens18, color: Colors.white),
                  children: [
                    TextSpan(
                        text: "azul, ",
                        style: TextStyle(
                            fontSize: Dimens.dimens18,
                            color: Colors.blue[800])),
                    TextSpan(
                        text: " mientras que los reservados en color ",
                        style: TextStyle(
                            fontSize: Dimens.dimens18, color: Colors.white)),
                    TextSpan(
                        text: "amarillo.",
                        style: TextStyle(
                            fontSize: Dimens.dimens18,
                            color: ColorsApp.amarilloLibre)),
                  ]),
              textAlign: TextAlign.center,
            ),
          ),
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
                  _TurnosProfesionalDisponibles(
                      profesional: profesional, especialidad: especialidad)
                ])),
          )
        ],
      ),
    );
  }

  Widget fechasDisponibles(BuildContext context) {
    final perfilProfesionalProvider =
        Provider.of<PerfilProfesionalProvider>(context, listen: false);

    return DateTimeHorizontalPicker(
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

    List<TurnoModel> turnos = [];

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

        TurnoModel turno = TurnoModel(
            modalidadAtencion: agendaTurnos.modalidadAtencion,
            consultorio: agendaTurnos.consultorio,
            profesional: profesional,
            especialidad: especialidad,
            idAgendaTurnos: agendaTurnos.id,
            precio: agendaTurnos.precio,
            fecha: perfilProfesionalProvider.fechaAgendaTurnosSeleccionada!,
            horaInicio: horaInicioTurnoAux,
            horaFin: horaFinTurno,
            disponible: agendaTurnos.turnosReservados
                .where((turno) =>
                    turno.fecha ==
                        perfilProfesionalProvider
                            .fechaAgendaTurnosSeleccionada &&
                    turno.horaInicio.isEquals(horaInicioTurnoAux) &&
                    turno.horaFin.isEquals(horaFinTurno))
                .toList()
                .isEmpty);
        turnos.add(turno);

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
  final TurnoModel? turno;

  const _TurnoContainer({this.turno});

  @override
  Widget build(BuildContext context) {
    if (turno != null) {
      return InkWell(
        onTap: (turno!.disponible)
            ? () {
                Navigator.pushNamed(
                    context, DetalleSolicitudTurnoPage.routeName,
                    arguments: turno!);
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
            padding: EdgeInsets.symmetric(
                horizontal: Dimens.dimens5, vertical: Dimens.dimens10),
            child: Column(
              children: [
                SubdescriptionText(
                    text: turno!.horaInicio.convertToString(),
                    color: Colors.white),
                SubdescriptionText(
                    text: "\$${turno!.precio}",
                    color: Colors.white,
                    fontWeight: FontWeight.bold)
              ],
            )),
      );
    } else {
      return Container();
    }
  }
}
