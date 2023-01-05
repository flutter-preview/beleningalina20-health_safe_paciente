import 'package:flutter/material.dart';
import 'package:health_safe_paciente/src/helpers/helpers.dart';
import 'package:health_safe_paciente/src/theme/colors_app.dart';
import 'package:health_safe_paciente/src/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  static const String routeName = 'HomePage';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const AppbarCustom(),
        body: Padding(
          padding: EdgeInsets.all(SizeConfig.height * 0.02),
          child: SingleChildScrollView(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const LogoHealthSafe(textColor: Colors.black),
              ElevatedButtonCustom(
                onPressed: () {
                  // TODO Navegar a sacar turno
                },
                text: 'Sacar turno',
                backgroundColor: ColorsApp.azulBusqueda,
              ),
              ElevatedButtonCustom(
                  onPressed: () {
                    // TODO Navegar a solicitar asistencia inmediata
                  },
                  text: 'Solicitar asistencia inmediata',
                  backgroundColor: ColorsApp.rojoAsistenciaInmediata),
            ],
          )),
        ),
        drawer: const DrawerCustom(),
      ),
    );
  }
}
