import 'package:flutter/material.dart';
import 'package:health_safe_paciente/src/helpers/helpers.dart';
import 'package:health_safe_paciente/src/resources/dimens.dart';
import 'package:health_safe_paciente/src/widgets/text_custom.dart';

class ElevatedButtonCustom extends StatelessWidget {
  final bool large;
  final void Function() onPressed;
  final String text;
  final Color backgroundColor;
  final Color foregroundColor;
  final EdgeInsetsGeometry? margin;

  const ElevatedButtonCustom(
      {super.key,
      this.large = true,
      required this.onPressed,
      required this.text,
      this.backgroundColor = Colors.blue,
      this.foregroundColor = Colors.white,
      this.margin});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: margin,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              backgroundColor: backgroundColor,
              padding: const EdgeInsets.all(15),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Dimens.radius))),
          child: DisclaimerText(
              text: text, color: foregroundColor, fontWeight: FontWeight.bold),
        ));
  }
}
