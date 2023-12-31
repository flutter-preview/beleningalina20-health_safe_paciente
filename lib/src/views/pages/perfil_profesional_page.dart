import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:health_safe_paciente/src/models/models.dart';
import 'package:health_safe_paciente/src/services/api/api.dart';
import 'package:health_safe_paciente/src/views/pages/pages.dart';
import 'package:health_safe_paciente/src/views/providers/providers.dart';
import 'package:health_safe_paciente/src/theme/themes.dart';
import 'package:health_safe_paciente/src/views/widgets/widgets.dart';

class PerfilProfesionalPage extends StatelessWidget {
  static const String routeName = "PerfilProfesionalPage";

  const PerfilProfesionalPage({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    ProfesionalDto profesional = arguments['profesional'];
    EspecialidadDto especialidad = arguments['especialidad'];

    return SafeArea(
        child: Scaffold(
      appBar: const AppbarCustom(),
      backgroundColor: ColorsApp.celesteFondo,
      body: Column(children: <Widget>[
        Container(
            color: Colors.white,
            padding: EdgeInsets.all(Dimens.dimens20),
            child: InfoProfesionalCard(profesional: profesional)),
        FutureStatesBuilder<List<AgendaTurnosDto>>(
          future: AgendaTurnosService().obtenerAgendasTurnos(profesional.id),
          onEmpty: () => const MessageState(
              text: "El profesional no tiene agendas de turnos disponibles",
              iconState: EmptyIcon()),
          onError: (_) => const MessageState(
              text:
                  "Algo salió mal al cargar las agendas de turnos del profesional. Inténtalo más tarde.",
              iconState: FailureIcon()),
          onSuccess: (value) {
            profesional.agendasTurnos = value;
            return ChangeNotifierProvider(
                create: (_) =>
                    PerfilProfesionalProvider(agendasTurnosProfesional: value),
                child: _PagerView(
                  profesional: profesional,
                  especialidad: especialidad,
                ));
          },
        ),
      ]),
      drawer: const DrawerCustom(),
    ));
  }
}

class _PagerView extends StatelessWidget {
  final ProfesionalDto profesional;
  final EspecialidadDto especialidad;
  const _PagerView({required this.profesional, required this.especialidad});

  @override
  Widget build(BuildContext context) {
    final perfilProfesionalProvider =
        Provider.of<PerfilProfesionalProvider>(context);

    return Expanded(
      child: Column(
        children: [
          BottomNavigationBar(
              iconSize: 0.0,
              backgroundColor: Colors.white,
              selectedLabelStyle:
                  TextStyle(color: Colors.blue, fontSize: Dimens.dimens22),
              unselectedLabelStyle:
                  TextStyle(color: Colors.grey, fontSize: Dimens.dimens20),
              currentIndex: perfilProfesionalProvider.paginaActual,
              onTap: (int index) =>
                  perfilProfesionalProvider.paginaActual = index,
              items: const [
                BottomNavigationBarItem(icon: Icon(null), label: 'Turnos'),
                BottomNavigationBarItem(icon: Icon(null), label: 'Atención'),
                BottomNavigationBarItem(icon: Icon(null), label: 'Información')
              ]),
          (perfilProfesionalProvider.paginaActual == 0)
              ? TurnosProfesionalPage(
                  profesional: profesional,
                  especialidad: especialidad,
                )
              : (perfilProfesionalProvider.paginaActual == 1)
                  ? AtencionProfesionalPage(profesional: profesional)
                  : InformacionProfesionalPage(profesional: profesional)
        ],
      ),
    );
  }
}
