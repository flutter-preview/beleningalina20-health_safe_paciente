import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:health_safe_paciente/src/helpers/helpers.dart';
import 'package:health_safe_paciente/src/theme/themes.dart';

class DrawerCustom extends StatelessWidget {
  const DrawerCustom({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO llamar a usuario provider

    return Drawer(
        child: Container(
      color: ColorsApp.azulLogin,
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        const _HeaderDrawer(
            urlImagenPerfil:
                'https://aishlatino.com/wp-content/uploads/2021/11/que-tipo-de-persona-te-gustaria-ser-730x411-SP.jpg',
            nombre: 'Belén',
            apellido: 'Ingalina'),
        FutureBuilder(
          future: _DrawerProvider.drawerProvider.opciones,
          builder: (BuildContext context,
              AsyncSnapshot<List<OpcionMenu>?> snapshot) {
            if (snapshot.hasData) {
              return Column(
                  children: snapshot.data!
                      .map((opcion) => _ListTileDrawer(opcion: opcion))
                      .toList());
            }
            return const Center(child: CircularProgressIndicator());
          },
        )
      ]),
    ));
  }
}

class _HeaderDrawer extends StatelessWidget {
  final String urlImagenPerfil;
  final String nombre;
  final String apellido;

  const _HeaderDrawer(
      {required this.urlImagenPerfil,
      required this.nombre,
      required this.apellido});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(SizeConfig.height * 0.02),
      child: Column(
        children: <Widget>[
          CircleAvatar(
              backgroundImage: NetworkImage(urlImagenPerfil),
              radius: SizeConfig.height * 0.09),
          SizedBox(height: SizeConfig.height * 0.02),
          Text("$nombre $apellido".toUpperCase(),
              style: Theme.of(context)
                  .textTheme
                  .headline2!
                  .copyWith(color: Colors.white, fontWeight: FontWeight.w400)),
        ],
      ),
    );
  }
}

class _ListTileDrawer extends StatelessWidget {
  final OpcionMenu opcion;

  const _ListTileDrawer({required this.opcion});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(color: ColorsApp.celesteFondo),
        ListTile(
            contentPadding: EdgeInsets.all(SizeConfig.height * 0.01),
            title: Text(opcion.title,
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(color: Colors.white)),
            onTap: () {
              // todo onTap
            }),
      ],
    );
  }
}

class _DrawerProvider {
  static final _DrawerProvider drawerProvider = _DrawerProvider._();

  _DrawerProvider._();

  static List<OpcionMenu>? _opciones;

  Future<List<OpcionMenu>?> get opciones async {
    _opciones ??= await cargarOpciones();
    return _opciones!;
  }

  Future<List<OpcionMenu>> cargarOpciones() async {
    final String data =
        await rootBundle.loadString('assets/data/drawer_opciones.json');
    final OpcionesMenu opciones = opcionesMenuFromJson(data);
    return opciones.options;
  }
}

OpcionesMenu opcionesMenuFromJson(String str) =>
    OpcionesMenu.fromJson(json.decode(str));

class OpcionesMenu {
  OpcionesMenu({required this.page, required this.options});

  String page;
  List<OpcionMenu> options;

  factory OpcionesMenu.fromJson(Map<String, dynamic> json) => OpcionesMenu(
      page: json['page'],
      options: List<OpcionMenu>.from(
          json['options'].map((option) => OpcionMenu.fromJson(option))));
}

class OpcionMenu {
  OpcionMenu({
    required this.title,
    required this.routeName,
  });

  String title;
  String routeName;

  factory OpcionMenu.fromJson(Map<String, dynamic> json) => OpcionMenu(
        title: json["title"],
        routeName: json["routeName"],
      );
}
