import 'package:flutter/material.dart';
import 'package:health_safe_paciente/src/models/models.dart';
import 'package:health_safe_paciente/src/pages/pages.dart';
import 'package:health_safe_paciente/src/services/services.dart';
import 'package:health_safe_paciente/src/theme/themes.dart';
import 'package:health_safe_paciente/src/widgets/widgets.dart';

class ListadoProfesionalesPage extends StatelessWidget {
  static const String routeName = "ListadoProfesionalesPage";
  const ListadoProfesionalesPage({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    Especialidad especialidad = arguments['especialidad'];
    ModalidadAtencion modalidadAtencion = arguments['modalidadAtencion'];
    Localidad? localidad = arguments['localidad'];

    return SafeArea(
        child: Scaffold(
            appBar: const AppbarCustom(),
            backgroundColor: ColorsApp.celesteFondo,
            body: Column(
              children: [
                HeaderPage(
                    title:
                        "${especialidad.toString()} ${(localidad != null) ? "en ${localidad.toString()}" : ""}"),
                Expanded(
                  child: _ListadoProfesionales(
                      especialidad: especialidad,
                      modalidadAtencion: modalidadAtencion,
                      localidad: localidad),
                ),
              ],
            ),
            drawer: const DrawerCustom()));
  }
}

class _ListadoProfesionales extends StatelessWidget {
  final Especialidad especialidad;
  final ModalidadAtencion modalidadAtencion;
  final Localidad? localidad;

  const _ListadoProfesionales(
      {Key? key,
      required this.especialidad,
      required this.modalidadAtencion,
      required this.localidad})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final profesionalService = ProfesionalService();
    return FutureBuilder(
      future: profesionalService.obtenerProfesionales(
          especialidad, modalidadAtencion, localidad),
      builder:
          (BuildContext context, AsyncSnapshot<List<Profesional>> snapshot) {
        if (snapshot.hasData) {
          List<Profesional> profesionales = snapshot.data!;
          if (profesionales.isEmpty) {
            // TODO Mensaje de listado sin resultado
          } else {
            return ListView.separated(
              itemCount: profesionales.length,
              itemBuilder: (BuildContext context, int index) => ProfesionalCard(
                  profesional: profesionales[index],
                  onPressed: () => Navigator.pushNamed(
                      context, PerfilProfesionalPage.routeName,
                      arguments: profesionales[index])),
              separatorBuilder: (_, __) => SizedBox(height: Dimens.dimens10),
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              padding: EdgeInsets.all(Dimens.dimens10),
            );
          }
        }
        if (snapshot.hasError) {
          // TODO Listado de profesionales - error
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
