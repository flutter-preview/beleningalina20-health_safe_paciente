import 'package:flutter/material.dart';
import 'package:health_safe_paciente/src/theme/themes.dart';

class ElevatedButtonCustom extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final Color backgroundColor;
  final Color foregroundColor;
  final EdgeInsetsGeometry? margin;
  final bool expanded;

  const ElevatedButtonCustom(
      {super.key,
      required this.text,
      required this.onPressed,
      this.backgroundColor = ColorsApp.azulBusqueda,
      this.foregroundColor = Colors.white,
      this.margin,
      this.expanded = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: ElevatedButton(
        onPressed: onPressed,
        // autofocus: ,
        // clipBehavior: ,
        // focusNode: ,
        // key: ,
        // onFocusChange: ,
        // onHover: ,
        // onLongPress: ,
        // statesController: ,
        style: ElevatedButton.styleFrom(
          alignment: Alignment.center,
          // animationDuration: ,
          backgroundColor: backgroundColor,
          disabledBackgroundColor: backgroundColor,
          // si es blanco que quede blanco. Si no que sea más claro, transparencia
          // disabledForegroundColor: Por defecto es un gris,
          // disabledMouseCursor: ,
          elevation: Dimens.elevation2,
          // enableFeedback: ,
          // enabledMouseCursor: ,
          fixedSize: (expanded) ? Size.fromWidth(SizeConfig.width) : null,
          foregroundColor: foregroundColor,
          // maximumSize: ,
          // minimumSize: ,
          // onPrimary, primary, onSurface => Deprecado
          padding: EdgeInsets.symmetric(
              vertical: Dimens.dimens20, horizontal: Dimens.dimens10),
          // shadowColor: ,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimens.dimens10),
          ),
          // side: ,
          // splashFactory: ,
          // surfaceTintColor: ,
          // tapTargetSize: ,
          textStyle:
              TextStyle(fontSize: Dimens.dimens20, fontWeight: FontWeight.bold),
          // visualDensity:
        ),
        child: Text(text),
      ),
    );
  }
}

class TextButtonCustom extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  final Color foregroundColor;
  final bool enabled;

  const TextButtonCustom(
      {super.key,
      required this.text,
      required this.onPressed,
      this.enabled = true,
      this.foregroundColor = Colors.lightBlue});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: (enabled) ? onPressed : null,
      // autofocus: ,
      // clipBehavior: ,
      // focusNode: ,
      // key: ,
      // onFocusChange: ,
      // onHover: ,
      // onLongPress: ,
      // statesController: ,
      style: TextButton.styleFrom(
        alignment: Alignment.center,
        // animationDuration: ,
        // backgroundColor: ,
        // disabledBackgroundColor: ,
        // disabledForegroundColor: ,
        // disabledMouseCursor: ,
        // elevation: ,
        // enableFeedback: ,
        // enabledMouseCursor: ,
        // fixedSize: ,
        foregroundColor: foregroundColor,
        // maximumSize: ,
        // minimumSize: ,
        // onSurface, primary Deprecado
        padding: EdgeInsets.all(Dimens.dimens20),
        // shadowColor: ,
        // shape: ,
        // side: ,
        // splashFactory: ,
        // surfaceTintColor: ,
        // tapTargetSize: ,
        textStyle: TextStyle(
          fontSize: Dimens.dimens20,
          decoration: TextDecoration.underline,
        ),
        // visualDensity: ,
      ),
      child: Text(text, textAlign: TextAlign.center),
    );
  }
}
