import 'package:flutter/material.dart';
import 'package:health_safe_paciente/src/models/models.dart';
import 'package:health_safe_paciente/src/theme/themes.dart';
import 'package:health_safe_paciente/src/views/widgets/widgets.dart';

class CalificacionProfesionalPage extends StatelessWidget {
  static const String routeName = "CalificacionProfesionalPage";
  const CalificacionProfesionalPage({super.key});

  @override
  Widget build(BuildContext context) {
    ProfesionalDto profesional =
        ModalRoute.of(context)?.settings.arguments as ProfesionalDto;

    double calificacion = 0.0;

    return SafeArea(
      child: Scaffold(
        appBar: const AppbarCustom(),
        drawer: const DrawerCustom(),
        backgroundColor: ColorsApp.azulLogin,
        body: Padding(
          padding: EdgeInsets.all(Dimens.dimens20),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const TitleText(
                    textAlign: TextAlign.center,
                    color: Colors.white,
                    text: "¡Muchas gracias por confiar en Health Safe!"),
                SizedBox(height: Dimens.dimens20),
                const DescriptionText(
                    textAlign: TextAlign.center,
                    color: Colors.white,
                    text:
                        "Si desea, califique la atención del profesional que lo atendió"),
                SizedBox(height: Dimens.dimens20),
                InfoProfesionalCard(profesional: profesional),
                SizedBox(height: Dimens.dimens20),
                const BodyText(
                  text: "Mi calificacion",
                  textAlign: TextAlign.center,
                  color: Colors.white,
                ),
                SizedBox(height: Dimens.dimens20),
                RatingBarTextField(
                    onUpdated: (value) => {calificacion = value}),
                SizedBox(height: Dimens.dimens20),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButtonCustom(
                          onPressed: () => Navigator.pop(context),
                          text: "Omitir"),
                    ),
                    SizedBox(width: Dimens.dimens20),
                    Expanded(
                      child: ElevatedButtonCustom(
                          onPressed: () =>
                              _calificarProfesional(context, calificacion),
                          text: "Calificar"),
                    ),
                  ],
                )
              ]),
        ),
      ),
    );
  }

  void _calificarProfesional(BuildContext context, double calificacion) {
    // TODO Calificar profesional
    Navigator.pop(context);
  }
}
