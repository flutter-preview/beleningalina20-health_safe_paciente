import 'package:flutter/material.dart';
import 'package:health_safe_paciente/src/models/models.dart';
import 'package:health_safe_paciente/src/services/api/api.dart';
import 'package:health_safe_paciente/src/services/api/models/models.dart';
import 'package:health_safe_paciente/src/theme/themes.dart';
import 'package:health_safe_paciente/src/views/providers/providers.dart';
import 'package:health_safe_paciente/src/views/widgets/widgets.dart';
import 'package:provider/provider.dart';

class CalificacionAtencionProfesionalPage extends StatelessWidget {
  static const String routeName = "CalificacionAtencionTurnoPage";
  const CalificacionAtencionProfesionalPage({super.key});

  @override
  Widget build(BuildContext context) {
    TurnoPacienteDto turno =
        ModalRoute.of(context)?.settings.arguments as TurnoPacienteDto;

    return SafeArea(
      child: Scaffold(
        appBar: const AppbarCustom(),
        drawer: const DrawerCustom(),
        backgroundColor: ColorsApp.azulLogin,
        body: ChangeNotifierProvider(
            create: (context) => CalificacionAtencionProfesionalProvider(),
            child: Padding(
              padding: EdgeInsets.all(Dimens.dimens20),
              child: Column(children: [
                _CalificacionAtencionProfesionalRating(
                    profesional: turno.profesional),
                _CalificarAtencionProfesionalButton(idTurno: turno.id!)
              ]),
            )),
      ),
    );
  }
}

class _CalificacionAtencionProfesionalRating extends StatelessWidget {
  final ProfesionalDto profesional;
  const _CalificacionAtencionProfesionalRating(
      {super.key, required this.profesional});

  @override
  Widget build(BuildContext context) {
    final provider =
        Provider.of<CalificacionAtencionProfesionalProvider>(context);

    return Expanded(
        child: Column(
      children: [
        const TitleText(
            textAlign: TextAlign.center,
            color: Colors.white,
            text: "¡Muchas gracias por confiar en Health Safe!"),
        SizedBox(height: Dimens.dimens20),
        const DescriptionText(
            textAlign: TextAlign.center,
            color: Colors.white,
            text: "Si desea, califique la atención del profesional"),
        SizedBox(height: Dimens.dimens80),
        InfoProfesionalCard(profesional: profesional),
        SizedBox(height: Dimens.dimens80),
        RatingBarTextField(
            rating: 0, onRatingUpdate: (value) => provider.rating = value),
      ],
    ));
  }
}

class _CalificarAtencionProfesionalButton extends StatelessWidget {
  final int idTurno;
  const _CalificarAtencionProfesionalButton({super.key, required this.idTurno});

  @override
  Widget build(BuildContext context) {
    final provider =
        Provider.of<CalificacionAtencionProfesionalProvider>(context);

    return (!provider.isLoading)
        ? Row(
            children: [
              Expanded(
                child: ElevatedButtonCustom(
                    onPressed: () => Navigator.pop(context),
                    text: "Cancelar",
                    backgroundColor: ColorsApp.rojoAsistenciaInmediata),
              ),
              SizedBox(width: Dimens.dimens20),
              Expanded(
                child: ElevatedButtonCustom(
                    onPressed: () async {
                      provider.isLoading = true;
                      await TurnoService()
                          .calificarTurno(CalificarAtencionTurnoRequest(
                              idTurno: idTurno,
                              calificacion: provider.rating.round()))
                          .then((value) => Navigator.pop(context))
                          .onError((error, stackTrace) => null)
                          .whenComplete(() => provider.isLoading = false);
                    },
                    text: "Calificar"),
              ),
            ],
          )
        : const Loader();
  }
}
