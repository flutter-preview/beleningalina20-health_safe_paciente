import 'package:flutter/material.dart';
import 'package:health_safe_paciente/src/models/models.dart';
import 'package:provider/provider.dart';
import 'package:health_safe_paciente/src/services/api/api_services.dart';
import 'package:health_safe_paciente/src/theme/themes.dart';
import 'package:health_safe_paciente/src/views/widgets/widgets.dart';

class MensajeChat extends StatelessWidget {
  final Mensaje mensaje;
  final AnimationController animationController;
  const MensajeChat(
      {Key? key, required this.mensaje, required this.animationController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final autenticacionService =
        Provider.of<AutenticacionService>(context, listen: false);
    // final paciente = autenticacionService.paciente;

    return FadeTransition(
      opacity: animationController,
      child: SizeTransition(
          sizeFactor: CurvedAnimation(
              parent: animationController, curve: Curves.easeOut),
          child: (mensaje.idEmisor == 00)
              ? MensajePaciente(mensaje: mensaje)
              : MensajeProfesional(mensaje: mensaje)),
    );
  }
}

class MensajePaciente extends StatelessWidget {
  final Mensaje mensaje;
  const MensajePaciente({super.key, required this.mensaje});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(
                bottom: Dimens.dimens20,
                right: Dimens.dimens20,
                left: Dimens.dimens100),
            padding: EdgeInsets.all(Dimens.dimens20),
            decoration: BoxDecoration(
                color: ColorsApp.celesteFondo,
                borderRadius:
                    BorderRadius.all(Radius.circular(Dimens.dimens20))),
            child: DescriptionText(text: mensaje.texto),
          ),
          // TODO Poner la fecha y hora del mensaje
        ],
      ),
    );
  }
}

class MensajeProfesional extends StatelessWidget {
  final Mensaje mensaje;
  const MensajeProfesional({super.key, required this.mensaje});

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.centerLeft,
        child: Container(
          margin: EdgeInsets.only(
              bottom: Dimens.dimens20,
              left: Dimens.dimens20,
              right: Dimens.dimens100),
          padding: EdgeInsets.all(Dimens.dimens20),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(Dimens.dimens20))),
          child: DescriptionText(text: mensaje.texto),
        ));
  }
}
