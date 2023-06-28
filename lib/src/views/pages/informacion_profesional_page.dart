import 'package:flutter/material.dart';
import 'package:health_safe_paciente/src/models/models.dart';
import 'package:health_safe_paciente/src/theme/themes.dart';
import 'package:health_safe_paciente/src/views/widgets/widgets.dart';

class InformacionProfesionalPage extends StatelessWidget {
  final ProfesionalDto profesional;
  const InformacionProfesionalPage({super.key, required this.profesional});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
              width: double.infinity,
              margin: EdgeInsets.all(Dimens.dimens10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(Dimens.dimens10)),
              padding: EdgeInsets.all(Dimens.dimens20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const DescriptionText(text: "Especialidades"),
                  const Divider(),
                  ...profesional.especialidades.map((especialidad) =>
                      SubdescriptionText(text: especialidad.toString()))
                ],
              ))
        ],
      ),
    );
  }
}
