import 'package:flutter/material.dart';
import 'package:health_safe_paciente/src/models/models.dart';
import 'package:health_safe_paciente/src/services/database/database_services.dart';
import 'package:health_safe_paciente/src/views/pages/chat_page.dart';
import 'package:health_safe_paciente/src/theme/dimens.dart';
import 'package:health_safe_paciente/src/views/widgets/widgets.dart';

class HomeChatPage extends StatelessWidget {
  static const String routeName = "HomeChatPage";
  const HomeChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: const AppbarCustom(habilitarNavegacionChat: false),
      body: Column(
        children: [
          const HeaderPage(title: "Mensajería"),
          Expanded(
            child: _ProfesionalesListado(),
          ),
        ],
      ),
      drawer: const DrawerCustom(),
    ));
  }
}

class _ProfesionalesListado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ProfesionalDatabaseService().obtenerProfesionales(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            // TODO Mensaje de error para obtener los profesionales
          }

          if (snapshot.hasData) {
            var profesionales = snapshot.data ?? [];

            return ListView.separated(
                separatorBuilder: (BuildContext _, int i) => const Divider(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: profesionales.length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (BuildContext _, int i) {
                  Container();
                  // return _ProfesionalMensaje(profesional: profesionales[i]);
                });
          }

          return const Loader();
        });
  }
}

class _ProfesionalMensaje extends StatelessWidget {
  final Profesional profesional;
  const _ProfesionalMensaje({required this.profesional});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(Dimens.dimens10),
      onTap: () => Navigator.pushNamed(context, ChatPage.routeName,
          arguments: profesional),
      leading: ImagenPerfilProfesional(
          urlImagenPerfil: profesional.usuario.imagenPerfil),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [DescriptionText(text: profesional.toString())],
      ),
    );
  }
}
