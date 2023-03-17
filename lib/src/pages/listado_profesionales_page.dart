import 'package:flutter/material.dart';
import 'package:health_safe_paciente/src/models/models.dart';
import 'package:health_safe_paciente/src/services/services.dart';
import 'package:health_safe_paciente/src/theme/size_config.dart';
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
          print("Hay data");
          List<Profesional> profesionales = snapshot.data!;
          if (profesionales.isEmpty) {
            print("Vacio");
            // TODO Mensaje de listado sin resultado
            return Container(child: Text("No hay profesionales para mostrar"));
          } else {
            print("Hay info");
            return ListView.separated(
              itemCount: profesionales.length,
              itemBuilder: (BuildContext context, int index) =>
                  ProfesionalCard(profesional: profesionales[index]),
              separatorBuilder: (_, __) => SizedBox(height: Dimens.padding20),
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              padding: EdgeInsets.all(Dimens.padding20),
            );
          }
        }
        if (snapshot.hasError) {
          return Container(
            alignment: Alignment.center,
            color: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                DescriptionText(
                  text: snapshot.error.toString(),
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: Dimens.padding10),
                Icon(Icons.warning,
                    color: Colors.orange, size: SizeConfig.height * 0.1),
                ElevatedButtonCustom(
                    margin: EdgeInsets.all(Dimens.padding20),
                    text: "Atrás",
                    onPressed: () {
                      Navigator.pop(context);
                    })
              ],
            ),
          );
        }
        print("loading");
        return Center(child: const CircularProgressIndicator());
      },
    );
  }
}

class ProfesionalCard extends StatelessWidget {
  final Profesional profesional;
  const ProfesionalCard({super.key, required this.profesional});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // TODO Navegar al perfil del profesional
      },
      child: Container(
        padding: EdgeInsets.all(Dimens.padding10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:
              BorderRadius.all(Radius.circular(Dimens.roundedCornerRadius20)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ImagenPerfilProfesional(
                    urlImagenPerfil: profesional.usuario.imagenPerfil),
                SizedBox(width: Dimens.padding10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BodyText(
                        text:
                            "${(profesional.usuario.sexo == "Masculino") ? "Dr." : "Dra."} ${profesional.usuario.nombre} ${profesional.usuario.apellido}",
                        overflow: TextOverflow.ellipsis),
                    DescriptionText(
                      text: profesional.especialidades
                          .map((especialidadProfesional) =>
                              especialidadProfesional.especialidad.descripcion)
                          .join(", "),
                      overflow: TextOverflow.ellipsis,
                      color: Colors.grey[700] ?? Colors.grey,
                    ),
                    RatingBar(
                      calificacion: profesional.calificacion,
                      numeroOpiniones: profesional.cantidadOpiniones,
                      onPressed: () {
                        // TODO Ver las opiniones
                      },
                    )
                  ],
                )
              ],
            ),
            SizedBox(height: Dimens.padding10),
            DescriptionText(
              text: profesional.consultorioPrincipal,
              textAlign: TextAlign.start,
            ).withPrefixIcon(Icons.location_on, Colors.grey[700]!),
            SizedBox(height: Dimens.padding10),
            DescriptionText(
              text: "Precio: ${profesional.rangoPrecioTurno}",
              textAlign: TextAlign.start,
            ).withPrefixIcon(Icons.monetization_on, Colors.grey[700]!),
            SizedBox(height: Dimens.padding10),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButtonCustom(
                  text: "Ver turnos", onPressed: () {}, expanded: false),
            )
          ],
        ),
      ),
    );
  }
}
