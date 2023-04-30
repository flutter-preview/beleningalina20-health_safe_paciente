import 'package:flutter/material.dart';
import 'package:health_safe_paciente/src/pages/pages.dart';
import 'package:health_safe_paciente/src/providers/providers.dart';
import 'package:health_safe_paciente/src/services/services.dart';
import 'package:provider/provider.dart';
import 'package:health_safe_paciente/src/models/models.dart';
import 'package:health_safe_paciente/src/theme/themes.dart';
import 'package:health_safe_paciente/src/widgets/widgets.dart';

class PerfilProfesionalPage extends StatelessWidget {
  static const String routeName = "PerfilProfesionalPage";

  const PerfilProfesionalPage({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    Profesional profesional = arguments['profesional'];
    Especialidad especialidad = arguments['especialidad'];

    return SafeArea(
        child: Scaffold(
      appBar: const AppbarCustom(),
      backgroundColor: ColorsApp.celesteFondo,
      body: Column(children: <Widget>[
        Container(
            color: Colors.white,
            padding: EdgeInsets.all(Dimens.dimens20),
            child: InfoProfesionalCard(profesional: profesional)),
        FutureBuilder(
            future: AgendaTurnosService().obtenerAgendasTurnos(profesional),
            builder: (BuildContext context,
                AsyncSnapshot<List<AgendaTurnos>> snapshot) {
              if (snapshot.hasData) {
                List<AgendaTurnos> agendasTurnos = snapshot.data ?? [];
                if (agendasTurnos.isEmpty) {
                  // TODO Mensaje de que no hay agendas de turnos para el profesional
                } else {
                  profesional.agendasTurnos = agendasTurnos;
                  return ChangeNotifierProvider(
                      create: (_) => PerfilProfesionalProvider(),
                      child: _PagerView(
                        profesional: profesional,
                        especialidad: especialidad,
                      ));
                }
              }
              if (snapshot.hasError) {
                // TODO Error al obtener las agendas de turnos
              }
              return const Center(child: CircularProgressIndicator());
            }),
      ]),
      drawer: const DrawerCustom(),
    ));
  }
}

class _PagerView extends StatelessWidget {
  final Profesional profesional;
  final Especialidad especialidad;
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
                  ? const AtencionProfesionalPage()
                  : const InformacionProfesionalPage()
        ],
      ),
    );
  }
}
