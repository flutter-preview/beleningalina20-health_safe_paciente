import 'package:flutter/material.dart';
import 'package:health_safe_paciente/src/theme/themes.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}
