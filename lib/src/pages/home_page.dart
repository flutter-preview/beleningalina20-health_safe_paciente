import 'package:flutter/material.dart';
import 'package:health_safe_paciente/src/helpers/utils/permission_handler.dart';
import 'package:health_safe_paciente/src/pages/busqueda_profesionales_page.dart';
import 'package:health_safe_paciente/src/theme/themes.dart';
import 'package:health_safe_paciente/src/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  static const String routeName = "HomePage";
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        var permissionHandler =
            Provider.of<PermissionHandler>(context, listen: false);
        permissionHandler.close();
        return true;
      },
      child: SafeArea(
          child: Scaffold(
              appBar: const AppbarCustom(),
              backgroundColor: Colors.white,
              body: Padding(
                  padding: EdgeInsets.all(Dimens.dimens20),
                  child: const Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        LogoHealthSafe(textColor: Colors.black),
                        _BotonesNavegacionHome()
                      ])),
              drawer: const DrawerCustom())),
    );
  }
}

class _BotonesNavegacionHome extends StatelessWidget {
  const _BotonesNavegacionHome();

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ElevatedButtonCustom(
          text: 'Sacar turno',
          onPressed: () =>
              Navigator.pushNamed(context, BusquedaProfesionalesPage.routeName),
          backgroundColor: ColorsApp.azulBusqueda,
          margin: EdgeInsets.only(bottom: Dimens.dimens40)),
      ElevatedButtonCustom(
          text: "Solicitar asistencia inmediata",
          onPressed: () => {}, // TODO Navegar sala de asistencia inmediata
          backgroundColor: ColorsApp.rojoAsistenciaInmediata,
          margin: EdgeInsets.only(bottom: Dimens.dimens40))
    ]);
  }
}
