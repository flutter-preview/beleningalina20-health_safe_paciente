import 'package:flutter/material.dart';
import 'package:health_safe_paciente/src/theme/themes.dart';
import 'package:health_safe_paciente/src/views/widgets/widgets.dart';

void showMessageAlertDialog(BuildContext context, String message) {
  showDialog(
    context: context,
    useSafeArea: true,
    builder: (context) => SimpleMessageAlertDialog(message: message),
  );
}

class SimpleMessageAlertDialog extends StatelessWidget {
  final String message;
  const SimpleMessageAlertDialog({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const _AlertDialogTitle(),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimens.dimens10)),
      titlePadding: EdgeInsets.all(Dimens.dimens20),
      alignment: Alignment.center,
      backgroundColor: Colors.white,
      contentPadding: EdgeInsets.all(Dimens.dimens20),
      elevation: Dimens.dimens10,
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [DescriptionText(text: message, textAlign: TextAlign.center)],
      ),
    );
  }
}

//

// Alert dialog con signo de error
// Alert dialog con signo de success
// Alert dialog loading

// select imagen
// Permisos
class _AlertDialogTitle extends StatelessWidget {
  const _AlertDialogTitle();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(right: Dimens.dimens20),
          child: Image(
              image: const AssetImage('assets/imgs/logo_health_safe.png'),
              height: Dimens.dimens50),
        ),
        const BodyText(text: "Health Safe"),
      ],
    );
  }
}

class AlertDialogCustom extends StatelessWidget {
  final void Function()? onAccept;
  final void Function()? onCancel;
  final Widget child;
  const AlertDialogCustom(
      {super.key, this.onAccept, this.onCancel, required this.child});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(right: Dimens.dimens20),
            child: Image(
                image: const AssetImage('assets/imgs/logo_health_safe.png'),
                height: Dimens.dimens50),
          ),
          const BodyText(text: "Health Safe"),
        ],
      ),
      actions: [
        if (onAccept != null)
          ElevatedButtonCustom(text: "Aceptar", onPressed: onAccept),
        if (onCancel != null)
          ElevatedButtonCustom(text: "Cancelar", onPressed: onCancel)
      ],
      actionsAlignment: MainAxisAlignment.center,
      /*actionsOverflowAlignment: ,
        actionsOverflowButtonSpacing: ,
        actionsOverflowDirection: ,
        actionsPadding: ,*/
      alignment: Alignment.center,
      backgroundColor: Colors.white,
      // buttonPadding: ,
      // clipBehavior: ,
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [child],
      ),
      contentPadding: EdgeInsets.all(Dimens.dimens20),
      // contentTextStyle: Definido con el content,
      elevation: Dimens.dimens10,
      // icon: , Agregado con el title como un row el logo
      // iconColor: ,
      // iconPadding: ,
      /*insetPadding: ,
        key: ,
        scrollable: ,
        semanticLabel: ,*/
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimens.dimens10),
        // side:
      ),
      titlePadding: EdgeInsets.all(Dimens.dimens20),
      // titleTextStyle: Definido con el title
    );
  }
}

void showDialogCustom(
  BuildContext context,
  Widget child, {
  bool barrierDismissible = true,
  void Function()? onAccept,
  void Function()? onCancel,
}) {
  showDialog(
    context: context,
    useSafeArea: true,
    /*anchorPoint: ,
    barrierColor: ,*/
    barrierDismissible: barrierDismissible,
    /*barrierLabel: ,
    routeSettings: ,
    useRootNavigator: ,*/
    builder: (context) {
      return AlertDialogCustom(child: child);
    },
  );
}
