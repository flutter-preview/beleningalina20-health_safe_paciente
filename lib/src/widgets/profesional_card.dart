import 'package:flutter/material.dart';
import 'package:health_safe_paciente/src/models/models.dart';
import 'package:health_safe_paciente/src/theme/themes.dart';
import 'package:health_safe_paciente/src/widgets/widgets.dart';

class ProfesionalCard extends StatelessWidget {
  final Profesional profesional;
  final void Function()? onPressed;
  final bool expanded;
  const ProfesionalCard(
      {super.key,
      required this.profesional,
      this.onPressed,
      this.expanded = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Dimens.dimens10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(Dimens.dimens20)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InfoProfesionalCard(profesional: profesional),
          SizedBox(height: Dimens.dimens10),
          DescriptionText(
            text: profesional.consultorioPrincipal,
            textAlign: TextAlign.start,
          ).withPrefixIcon(Icons.location_on, Colors.grey[700]!),
          SizedBox(height: Dimens.dimens10),
          DescriptionText(
            text: "Precio: ${profesional.rangoPrecioTurno}",
            textAlign: TextAlign.start,
          ).withPrefixIcon(Icons.monetization_on, Colors.grey[700]!),
          SizedBox(height: Dimens.dimens10),
          Align(
            alignment: Alignment.centerRight,
            child: ElevatedButtonCustom(
                text: "Ver turnos", onPressed: onPressed, expanded: false),
          )
        ],
      ),
    );
  }
}

class InfoProfesionalCard extends StatelessWidget {
  final Profesional profesional;
  const InfoProfesionalCard({super.key, required this.profesional});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ImagenPerfilProfesional(
            urlImagenPerfil: profesional.usuario.imagenPerfil),
        SizedBox(width: Dimens.dimens10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BodyText(
                text: profesional.toString(), overflow: TextOverflow.ellipsis),
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
    );
  }
}
