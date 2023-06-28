import 'package:flutter/material.dart';
import 'package:health_safe_paciente/src/views/pages/pages.dart';
import 'package:health_safe_paciente/src/views/widgets/widgets.dart';

class MiCuentaPage extends StatelessWidget {
  static const String routeName = "MiCuentaPage";
  const MiCuentaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        appBar: AppbarCustom(),
        drawer: DrawerCustom(),
        body: Column(
          children: [
            HeaderPage(title: 'Mi cuenta'),
            ListTileMenuOpcion(
                title: "Datos del usuario",
                subtitle:
                    "Cambia tu contraseña, correo electrónico e imagen de perfil",
                icon: Icons.person,
                paginaDestino: CuentaDatosUsuarioPage.routeName),
            Divider(),
            ListTileMenuOpcion(
                title: "Datos personales",
                subtitle: "Mira tu datos personales que registraste",
                icon: Icons.verified_user,
                paginaDestino: CuentaDatosPersonalesPage.routeName),
            Divider(),
            ListTileMenuOpcion(
                title: "Datos del paciente",
                subtitle: "Cambia tu ocupación",
                icon: Icons.work_rounded,
                paginaDestino: CuentaDatosPacientePage.routeName),
            // TODO Medios de pagos - obtener los comprobantes de los pagos de los turnos - endpoint de mercado pago
            // TODO Mi historia clinica
          ],
        ),
      ),
    );
  }
}
