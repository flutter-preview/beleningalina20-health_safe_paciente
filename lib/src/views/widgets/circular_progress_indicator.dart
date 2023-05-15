import 'package:flutter/material.dart';
import 'package:health_safe_paciente/src/theme/themes.dart';

class CircularProgressIndicatorCustom extends StatelessWidget {
  const CircularProgressIndicatorCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: SizeConfig.height * 0.02,
        width: SizeConfig.height * 0.02,
        margin: EdgeInsets.symmetric(vertical: Dimens.dimens20),
        child: const CircularProgressIndicator());
  }
}
