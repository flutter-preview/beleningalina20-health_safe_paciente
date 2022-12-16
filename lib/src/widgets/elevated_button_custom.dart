import 'package:flutter/material.dart';
import 'package:health_safe_paciente/src/helpers/helpers.dart';

class ElevatedButtonCustom extends StatelessWidget {
  final bool large;
  final void Function() onPressed;
  final String text;
  final Color backgroundColor;
  final Color foregroundColor;

  const ElevatedButtonCustom(
      {super.key,
      this.large = true,
      required this.onPressed,
      required this.text,
      this.backgroundColor = Colors.blue,
      this.foregroundColor = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(
            vertical: SizeConfig.height * 0.04,
            horizontal: SizeConfig.height * 0.06),
        child: ElevatedButton(
          onPressed: onPressed,
          style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
                foregroundColor: MaterialStateProperty.resolveWith(
                    (states) => foregroundColor),
                backgroundColor: MaterialStateProperty.resolveWith(
                    (states) => backgroundColor),
              ),
          child: Text(text),
        ));
  }
}
