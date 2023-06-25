import 'package:flutter/material.dart';
import 'package:health_safe_paciente/src/models/models.dart';
import 'package:health_safe_paciente/src/services/api/api.dart';
import 'package:health_safe_paciente/src/services/api/models/models.dart';
import 'package:health_safe_paciente/src/views/pages/pages.dart';
import 'package:health_safe_paciente/src/theme/themes.dart';
import 'package:health_safe_paciente/src/views/widgets/widgets.dart';

class ListadoProfesionalesPage extends StatelessWidget {
  static const String routeName = "ListadoProfesionalesPage";
  const ListadoProfesionalesPage({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    EspecialidadDto especialidad = arguments['especialidad'];
    ModalidadAtencionDto modalidadAtencion = arguments['modalidadAtencion'];
    LocalidadDto? localidad = arguments['localidad'];

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
  final EspecialidadDto especialidad;
  final ModalidadAtencionDto modalidadAtencion;
  final LocalidadDto? localidad;

  const _ListadoProfesionales(
      {Key? key,
      required this.especialidad,
      required this.modalidadAtencion,
      required this.localidad})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureStatesBuilder<List<ProfesionalDto?>>(
      future: ProfesionalService().obtenerProfesionales(
          ObtenerProfesionalesRequest(
              idEspecialidad: especialidad.id,
              idModalidadAtencion: modalidadAtencion.id,
              idLocalidad: localidad?.codigoPostal)),
      onEmpty: () => const MessageState(
          text: "No se encontraron profesionales", iconState: EmptyIcon()),
      onError: () => const MessageState(
          text: "Algo salió mal al cargar la informacion",
          iconState: FailureIcon()),
      onSuccess: (value) => ListView.separated(
        itemCount: value.length,
        itemBuilder: (BuildContext context, int index) => ProfesionalCard(
            profesional: value[index]!,
            onPressed: () => Navigator.pushNamed(
                    context, PerfilProfesionalPage.routeName, arguments: {
                  "profesional": value[index],
                  "especialidad": especialidad
                })),
        separatorBuilder: (_, __) => SizedBox(height: Dimens.dimens10),
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.all(Dimens.dimens10),
      ),
    );
  }
}
