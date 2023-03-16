import 'package:flutter/material.dart';
import 'package:health_safe_paciente/src/theme/themes.dart';

extension TitleTextExtensions on TitleText {
  Row withPrefixIcon(IconData prefixIcon) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
            padding: EdgeInsets.only(right: Dimens.padding20),
            child:
                Icon(prefixIcon, color: Colors.white, size: Dimens.iconSize70)),
        this
      ],
    );
  }
}

extension DescriptionTextExtensions on DescriptionText {
  Row withPrefixIcon(IconData prefixIcon, [Color color = Colors.white]) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
            padding: EdgeInsets.only(right: Dimens.padding10),
            child: Icon(prefixIcon, color: color, size: Dimens.iconSize30)),
        this
      ],
    );
  }
}

class TitleText extends StatelessWidget {
  final String text;
  final Color color;
  final TextAlign textAlign;
  final IconData? prefixIcon;
  final FontWeight fontWeight;

  const TitleText(
      {super.key,
      required this.text,
      this.color = Colors.black,
      this.textAlign = TextAlign.start,
      this.prefixIcon,
      this.fontWeight = FontWeight.normal});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: Dimens.fontSize35, color: color, fontWeight: fontWeight),
      textAlign: textAlign,
    );
  }
}

class SubtitleText extends StatelessWidget {
  final String text;
  final Color color;
  final TextAlign textAlign;
  final FontWeight fontWeight;
  final IconData? prefixIcon;

  const SubtitleText(
      {super.key,
      required this.text,
      this.color = Colors.black,
      this.textAlign = TextAlign.start,
      this.fontWeight = FontWeight.normal,
      this.prefixIcon});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: Dimens.fontSize30,
        color: color,
        fontWeight: fontWeight,
      ),
    );
  }
}

class BodyText extends StatelessWidget {
  final String text;
  final Color color;
  final TextAlign textAlign;
  final double? fontSize;
  final TextOverflow? overflow;

  const BodyText(
      {super.key,
      required this.text,
      this.color = Colors.black,
      this.textAlign = TextAlign.start,
      this.fontSize,
      this.overflow});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
          fontSize: fontSize ?? Dimens.fontSize25,
          color: color,
        ),
        overflow: overflow,
        textAlign: textAlign);
  }
}

class DescriptionText extends StatelessWidget {
  final String text;
  final Color color;
  final TextAlign textAlign;
  final FontWeight? fontWeight;
  final TextOverflow? overflow;

  const DescriptionText(
      {super.key,
      required this.text,
      this.color = Colors.black,
      this.textAlign = TextAlign.start,
      this.fontWeight,
      this.overflow});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      overflow: overflow,
      style: TextStyle(
          fontSize: Dimens.fontSize20, color: color, fontWeight: fontWeight),
    );
  }
}
