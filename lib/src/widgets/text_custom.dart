import 'package:flutter/material.dart';
import 'package:health_safe_paciente/src/helpers/helpers.dart';

class TitleText extends StatelessWidget {
  final String text;
  final Color color;
  final FontWeight fontWeight;
  const TitleText(
      {super.key,
      required this.text,
      this.color = Colors.black,
      this.fontWeight = FontWeight.normal});

  @override
  Widget build(BuildContext context) {
    return Text(
      text, // 30.54
      style: TextStyle(fontSize: SizeConfig.height * 0.037, color: color),
    );
  }
}

class SubtitleText extends StatelessWidget {
  final String text;
  final Color color;
  const SubtitleText(
      {super.key, required this.text, this.color = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Text(
      text, //26.41
      style: TextStyle(fontSize: SizeConfig.height * 0.03, color: color),
    );
  }
}

class DescriptionText extends StatelessWidget {
  final String text;
  final Color color;

  const DescriptionText(
      {super.key, required this.text, this.color = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Text(
      text, // 22.28
      style: TextStyle(fontSize: SizeConfig.height * 0.023, color: color),
    );
  }
}

class DisclaimerText extends StatelessWidget {
  final String text;
  final Color color;
  final FontWeight fontWeight;

  const DisclaimerText(
      {super.key,
      required this.text,
      this.color = Colors.black,
      this.fontWeight = FontWeight.normal});

  @override
  Widget build(BuildContext context) {
    return Text(
      text, // 19.81
      style: TextStyle(
          fontSize: SizeConfig.height * 0.021,
          color: color,
          fontWeight: fontWeight),
    );
  }
}
