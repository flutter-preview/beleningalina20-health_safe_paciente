import 'package:flutter/material.dart';
import 'package:health_safe_paciente/src/theme/themes.dart';
import 'package:health_safe_paciente/src/views/widgets/widgets.dart';

class InformacionDetalle extends StatelessWidget {
  final String title;
  final String? information;
  const InformacionDetalle(
      {super.key, required this.title, required this.information});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: Dimens.dimens10),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        DescriptionText(text: title, fontWeight: FontWeight.w500),
        SizedBox(width: Dimens.dimens10),
        Expanded(child: DescriptionText(text: information ?? "")),
      ]),
    );
  }
}
