import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:health_safe_paciente/src/helpers/utils/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:health_safe_paciente/src/pages/pages.dart';
import 'package:health_safe_paciente/src/services/services.dart';
import 'package:health_safe_paciente/src/theme/themes.dart';
import 'package:health_safe_paciente/src/widgets/widgets.dart';

class DrawerCustom extends StatelessWidget {
  const DrawerCustom({super.key});

  @override
  Widget build(BuildContext context) {
    final autenticacionService =
        Provider.of<AutenticacionService>(context, listen: false);
    final usuario = autenticacionService.usuario!;

    return Drawer(
      backgroundColor: ColorsApp.azulLogin,
      width: SizeConfig.width * 0.7,
      child:
          Column(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
        _HeaderDrawer(
            imagenPerfil: usuario.imagenPerfil,
            nombre: usuario.nombre,
            apellido: usuario.apellido),
        const _OpcionesDrawer()
      ]),
    );
  }
}

class _HeaderDrawer extends StatelessWidget {
  final String imagenPerfil;
  final String nombre;
  final String apellido;

  const _HeaderDrawer(
      {required this.imagenPerfil,
      required this.nombre,
      required this.apellido});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Dimens.dimens20),
      child: Column(
        children: <Widget>[
          CircleAvatarImagenPerfil(
              radius: Dimens.dimens90, image: NetworkImage(imagenPerfil)),
          SubtitleText(
              text: "$nombre $apellido",
              color: Colors.white,
              textAlign: TextAlign.center),
        ],
      ),
    );
  }
}

class _OpcionesDrawer extends StatelessWidget {
  const _OpcionesDrawer();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _DrawerProvider.drawerProvider.opcionesDrawer,
      builder: (_, AsyncSnapshot<List<_OpcionDrawer>?> snapshot) {
        if (snapshot.hasData) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: snapshot.data!
                .map((opcion) => Column(
                      children: [
                        const Divider(color: ColorsApp.celesteFondo),
                        ListTileDrawerOption(
                            title: opcion.title,
                            textColor: Colors.white,
                            onTap: () => onTap(context, opcion)),
                      ],
                    ))
                .toList(),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  void onTap(BuildContext context, _OpcionDrawer opcion) {
    switch (opcion.title) {
      case "Inicio":
        Navigator.popUntil(context, (Route<dynamic> route) => false);
        Navigator.pushNamed(context, HomePage.routeName);
        break;
      case "Cerrar Sesión":
        var autenticacionService =
            Provider.of<AutenticacionService>(context, listen: false);
<<<<<<< HEAD
        var permissionHandler =
            Provider.of<PermissionHandler>(context, listen: false);
=======
        var socketService = Provider.of<SocketService>(context, listen: false);
        socketService.disconnect();
>>>>>>> b92aba1 (Chat page)
        autenticacionService.logout();
        permissionHandler.close();
        Navigator.of(context).pushNamedAndRemoveUntil(
            LoginPage.routeName, (Route<dynamic> route) => false);
        break;
      default:
        Navigator.popUntil(context, (Route<dynamic> route) => false);
        Navigator.pushNamed(context, HomePage.routeName);
        Navigator.pushNamed(context, opcion.routeName);
        break;
    }
  }
}

class _DrawerProvider {
  static final _DrawerProvider drawerProvider = _DrawerProvider._();
  _DrawerProvider._();

  List<_OpcionDrawer>? _opcionesDrawer;
  Future<List<_OpcionDrawer>?> get opcionesDrawer async {
    _opcionesDrawer ??= await cargarOpciones();
    return _opcionesDrawer;
  }

  Future<List<_OpcionDrawer>> cargarOpciones() async {
    final String resp =
        await rootBundle.loadString('assets/data/drawer_opciones.json');
    final data = json.decode(resp);
    return List<_OpcionDrawer>.from(
        data['options'].map((option) => _OpcionDrawer.fromJson(option)));
  }
}

class _OpcionDrawer {
  _OpcionDrawer({
    required this.title,
    required this.routeName,
  });

  String title;
  String routeName;

  factory _OpcionDrawer.fromJson(Map<String, dynamic> json) => _OpcionDrawer(
        title: json["title"],
        routeName: json["routeName"],
      );
}
