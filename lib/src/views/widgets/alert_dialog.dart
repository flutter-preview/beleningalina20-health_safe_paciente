import 'package:flutter/material.dart';
import 'package:health_safe_paciente/src/theme/themes.dart';
import 'package:health_safe_paciente/src/views/widgets/widgets.dart';

class AlertDialogBackground extends StatelessWidget {
  final List<Widget> content;
  final void Function()? onAccept;
  final void Function()? onCancel;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final Alignment alignment;
  const AlertDialogBackground(
      {super.key,
      required this.content,
      this.onAccept,
      this.onCancel,
      this.mainAxisAlignment = MainAxisAlignment.center,
      this.crossAxisAlignment = CrossAxisAlignment.center,
      this.alignment = Alignment.center});

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
      alignment: alignment,
      backgroundColor: Colors.white,
      // buttonPadding: ,
      // clipBehavior: ,
      content: Column(
          mainAxisAlignment: mainAxisAlignment,
          crossAxisAlignment: crossAxisAlignment,
          mainAxisSize: MainAxisSize.min,
          children: content),
      contentPadding: EdgeInsets.all(Dimens.dimens20),
      contentTextStyle: TextStyle(
        fontSize: Dimens.dimens22,
        color: Colors.black,
      ),
      elevation: Dimens.dimens10,
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
      title: const _TitleAlertDialog(),
    );
  }
}

class _TitleAlertDialog extends StatelessWidget {
  const _TitleAlertDialog();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image(
            image: const AssetImage('assets/imgs/logo_health_safe.png'),
            height: Dimens.dimens60),
        SizedBox(width: Dimens.dimens20),
        const Text("Health Safe"),
      ],
    );
  }
}
