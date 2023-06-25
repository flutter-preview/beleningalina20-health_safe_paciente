import 'package:flutter/material.dart';
import 'package:health_safe_paciente/src/theme/themes.dart';
import 'package:health_safe_paciente/src/views/widgets/widgets.dart';

class AlertDialogBackground extends StatelessWidget {
  final List<Widget> content;
  final void Function()? onAccept;
  final void Function()? onCancel;
  const AlertDialogBackground(
      {super.key, required this.content, this.onAccept, this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actions: [
        if (onAccept != null)
          ElevatedButtonCustom(text: "Aceptar", onPressed: onAccept),
        if (onCancel != null)
          ElevatedButtonCustom(text: "Cancelar", onPressed: onCancel)
      ],
      actionsAlignment: MainAxisAlignment.spaceAround,
      // actionsOverflowAlignment: ,
      // actionsOverflowButtonSpacing: ,
      // actionsOverflowDirection: ,
      // actionsPadding: ,
      alignment: Alignment.center,
      backgroundColor: Colors.white,
      // buttonPadding: ,
      // clipBehavior: ,
      content: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: content),
      contentPadding: EdgeInsets.all(Dimens.dimens20),
      contentTextStyle: TextStyle(
        fontSize: Dimens.dimens22,
        color: Colors.black,
      ),
      elevation: Dimens.dimens10,
      icon: Image(
          image: const AssetImage('assets/imgs/logo_health_safe.png'),
          height: Dimens.dimens50),
      // iconColor: ,
      iconPadding: EdgeInsets.all(Dimens.dimens20),
      // insetPadding: ,
      // key: ,
      scrollable: false,
      // semanticLabel: ,
      // shadowColor: ,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimens.dimens10)),
      // surfaceTintColor: ,
      title: const BodyText(text: "Health Safe"),
      titlePadding: EdgeInsets.all(Dimens.dimens20),
      titleTextStyle: TextStyle(
        fontSize: Dimens.dimens25,
        color: Colors.black,
      ),
    );
  }
}
