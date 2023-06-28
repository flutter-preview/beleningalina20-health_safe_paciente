import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:health_safe_paciente/src/models/models.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:health_safe_paciente/src/services/api/api.dart';
import 'package:health_safe_paciente/src/views/pages/pages.dart';
import 'package:health_safe_paciente/src/views/providers/providers.dart';
import 'package:health_safe_paciente/src/extensions/extensions.dart';
import 'package:health_safe_paciente/src/theme/colors_app.dart';
import 'package:health_safe_paciente/src/theme/dimens.dart';
import 'package:health_safe_paciente/src/views/widgets/widgets.dart';

class MisTurnosPage extends StatelessWidget {
  static const String routeName = "MisTurnosPage";
  const MisTurnosPage({super.key});

  @override
  Widget build(BuildContext context) {
    final autenticacionService = Provider.of<AutenticacionService>(context);

    return SafeArea(
      child: Scaffold(
        appBar: const AppbarCustom(),
        backgroundColor: ColorsApp.celesteFondo,
        body: Column(
          children: [
            const HeaderPage(title: "Mis turnos"),
            Expanded(
              child: FutureStatesBuilder<List<TurnoPacienteDto>>(
                future: TurnoService()
                    .obtenerTurnos(autenticacionService.usuario!.id),
                onEmpty: () => const MessageState(
                    text: "No hay turnos guardados", iconState: EmptyIcon()),
                onError: () => const MessageState(
                    text: "Algo salió mal al cargar la informacion",
                    iconState: FailureIcon()),
                onSuccess: (value) => ChangeNotifierProvider(
                    create: (_) => MisTurnosProvider(),
                    child: _CalendarioTurnos(turnos: value)),
              ),
            )
          ],
        ),
        drawer: const DrawerCustom(),
      ),
    );
  }
}

class _CalendarioTurnos extends StatelessWidget {
  final List<TurnoPacienteDto> turnos;
  const _CalendarioTurnos({required this.turnos});

  @override
  Widget build(BuildContext context) {
    final misTurnosProvider = Provider.of<MisTurnosProvider>(context);

    return Column(
      children: [
        _TurnosCalendar(turnos: turnos),
        _DetalleTurnosPorFecha(
            fecha: misTurnosProvider.selectedDay,
            turnos: turnos
                .where((TurnoPacienteDto turno) => (turno.fecha.year ==
                        misTurnosProvider.selectedDay.year &&
                    turno.fecha.month == misTurnosProvider.selectedDay.month &&
                    turno.fecha.day == misTurnosProvider.selectedDay.day))
                .toList())
      ],
    );
  }
}

class _TurnosCalendar extends StatelessWidget {
  const _TurnosCalendar({
    Key? key,
    required this.turnos,
  }) : super(key: key);

  final List<TurnoPacienteDto> turnos;

  @override
  Widget build(BuildContext context) {
    final misTurnosProvider = Provider.of<MisTurnosProvider>(context);

    return Container(
        color: Colors.white,
        child: TableCalendar<TurnoPacienteDto>(
            locale: 'es_ES',
            firstDay: DateTime.utc(2020, 04, 01),
            lastDay: DateTime.utc(2030, 03, 14),
            focusedDay: misTurnosProvider.focusedDay,
            calendarFormat: CalendarFormat.month,
            startingDayOfWeek: StartingDayOfWeek.sunday,
            daysOfWeekVisible: true,
            onDaySelected: (DateTime selectDay, DateTime focusDay) {
              misTurnosProvider.selectedDay = selectDay;
              misTurnosProvider.focusedDay = focusDay;
            },
            selectedDayPredicate: (DateTime date) =>
                isSameDay(misTurnosProvider.selectedDay, date),
            eventLoader: (fecha) => turnos
                .where((TurnoPacienteDto turno) =>
                    (turno.fecha.year == fecha.year &&
                        turno.fecha.month == fecha.month &&
                        turno.fecha.day == fecha.day))
                .toList(),
            calendarStyle: CalendarStyle(
              isTodayHighlighted: true,
              markerDecoration: const BoxDecoration(
                  color: ColorsApp.azulLogin, shape: BoxShape.circle),
              selectedDecoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.rectangle,
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(Dimens.dimens10)),
              selectedTextStyle: const TextStyle(color: Colors.white),
              todayDecoration: BoxDecoration(
                  color: Colors.blue[200],
                  shape: BoxShape.rectangle,
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(Dimens.dimens10)),
              defaultDecoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(Dimens.dimens10)),
              weekendDecoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(Dimens.dimens10)),
            ),
            headerStyle: HeaderStyle(
                headerMargin: EdgeInsets.all(Dimens.dimens10),
                formatButtonVisible: false,
                titleCentered: true,
                formatButtonShowsNext: false)));
  }
}

class _DetalleTurnosPorFecha extends StatelessWidget {
  final List<TurnoPacienteDto> turnos;
  final DateTime fecha;
  const _DetalleTurnosPorFecha({
    Key? key,
    required this.fecha,
    required this.turnos,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(Dimens.dimens10)),
          width: double.infinity,
          margin: EdgeInsets.symmetric(
              vertical: Dimens.dimens20, horizontal: Dimens.dimens10),
          padding: EdgeInsets.all(Dimens.dimens20),
          child: SingleChildScrollView(
            child: Column(children: [
              Text(fecha.convertToString()),
              const Divider(),
              ...turnos.map(
                  (TurnoPacienteDto turno) => _InfoTurnoPaciente(turno: turno))
            ]),
          )),
    );
  }
}

class _InfoTurnoPaciente extends StatelessWidget {
  final TurnoPacienteDto turno;
  const _InfoTurnoPaciente({required this.turno});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Dimens.dimens20),
      margin: EdgeInsets.only(bottom: Dimens.dimens20),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          border: Border.all(color: Colors.blue),
          borderRadius: BorderRadius.circular(Dimens.dimens10)),
      child: InkWell(
          child: Row(children: [
            DescriptionText(
                text: turno.horaInicio.convertToString(),
                fontWeight: FontWeight.bold),
            SizedBox(width: Dimens.dimens20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DescriptionText(
                    text: "Profesional: ${turno.profesional}",
                    overflow: TextOverflow.ellipsis),
                DescriptionText(
                    text: "Especialidad: ${turno.especialidad.descripcion}",
                    overflow: TextOverflow.ellipsis),
                DescriptionText(
                    text: "Modalidad: ${turno.modalidadAtencion.descripcion}",
                    overflow: TextOverflow.ellipsis),
                if (turno.consultorio != null)
                  DescriptionText(
                      text: "Consultorio: ${turno.consultorio}",
                      overflow: TextOverflow.ellipsis),
              ],
            )
          ]),
          onTap: () => Navigator.pushNamed(context, DetalleTurnoPage.routeName,
              arguments: turno)),
    );
  }
}
