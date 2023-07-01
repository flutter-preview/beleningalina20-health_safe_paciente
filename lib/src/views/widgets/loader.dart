import 'package:flutter/material.dart';
import 'package:health_safe_paciente/src/theme/themes.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Dimens.dimens20),
      child: const Center(child: CircularProgressIndicator()),
    );
  }
}
