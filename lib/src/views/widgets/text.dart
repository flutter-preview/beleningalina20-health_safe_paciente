import 'package:flutter/material.dart';
import 'package:health_safe_paciente/src/theme/themes.dart';

extension TitleTextExtensions on TitleText {
  Row withPrefixIcon(IconData prefixIcon) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
            padding: EdgeInsets.only(right: Dimens.dimens20),
            child:
                Icon(prefixIcon, color: Colors.white, size: Dimens.dimens70)),
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
            padding: EdgeInsets.only(right: Dimens.dimens10),
            child: Icon(prefixIcon, color: color, size: Dimens.dimens30)),
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
      this.fontWeight = FontWeight.w500});

  @override
  Widget build(BuildContext context) {
    // d35 ->28
    // d30 -> 24
    // d25 -> 20
    // d20 -> 16
    return Text(
      text,
      style: TextStyle(
          fontSize: Dimens.dimens30,
          color: color,
          fontWeight: fontWeight,
          fontFamily: 'Montserrat'),
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
      this.fontWeight = FontWeight.w400,
      this.prefixIcon});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
          fontSize: Dimens.dimens25,
          color: color,
          fontWeight: fontWeight,
          fontFamily: 'Montserrat'),
    );
  }
}

class BodyText extends StatelessWidget {
  final String text;
  final Color color;
  final TextAlign textAlign;
  final double? fontSize;
  final TextOverflow? overflow;
  final TextDecoration? decoration;

  const BodyText(
      {super.key,
      required this.text,
      this.color = Colors.black,
      this.textAlign = TextAlign.start,
      this.fontSize,
      this.overflow,
      this.decoration});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
            fontSize: fontSize ?? Dimens.dimens25,
            color: color,
            decoration: decoration,
            fontFamily: 'Montserrat'),
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
          fontSize: Dimens.dimens20,
          color: color,
          fontWeight: fontWeight,
          fontFamily: 'Montserrat'),
    );
  }
}

class SubdescriptionText extends StatelessWidget {
  final String text;
  final Color color;
  final TextAlign textAlign;
  final FontWeight? fontWeight;
  final TextOverflow? overflow;

  const SubdescriptionText(
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
          fontSize: Dimens.dimens18,
          color: color,
          fontWeight: fontWeight,
          fontFamily: 'Montserrat'),
    );
  }
}
