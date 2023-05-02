import 'package:flutter/material.dart';
import 'package:health_safe_paciente/src/widgets/text.dart';

void showSnackBar(BuildContext context, String title) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: DescriptionText(text: title, color: Colors.white),
    backgroundColor: Colors.black87,
  ));
}
