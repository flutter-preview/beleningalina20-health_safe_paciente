import 'package:flutter/material.dart';
import 'package:health_safe_paciente/src/views/widgets/widgets.dart';

class HomeChatPage extends StatelessWidget {
  static const String routeName = "HomeChatPage";
  const HomeChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: const AppbarCustom(chatHabilitado: false),
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
    return Container();
    /*
    return FutureStatesBuilder<List<_OpcionDrawer>>(
      future:ProfesionalDatabaseService().obtenerProfesionales(),
      onEmpty: () => const MessageState(
          text: "No hay profesionales disponibles", iconState: EmptyIcon()),
      onError: () => const MessageState(
          text: "Algo salió mal al cargar los profesionales.",
          iconState: FailureIcon()),
      onSuccess: (value) => ListView.separated(
                separatorBuilder: (BuildContext _, int i) => const Divider(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: profesionales.length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (BuildContext _, int i) {
                  return _ProfesionalMensaje(profesional: profesionales[i]);
                })
    );*/
  }
}

/*class _ProfesionalMensaje extends StatelessWidget {
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
}*/
