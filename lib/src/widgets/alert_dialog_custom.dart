import 'package:flutter/material.dart';
import 'package:health_safe_paciente/src/helpers/helpers.dart';

class AlertDialogCustom extends StatelessWidget {
  final List<Widget> content;
  final List<Widget>? actions;
  const AlertDialogCustom({super.key, required this.content, this.actions});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        children: [
          Image(
              image: const AssetImage('assets/imgs/logo_health_safe.png'),
              height: SizeConfig.height * 0.07),
          SizedBox(width: SizeConfig.height * 0.05),
          const Text("Health Safe"),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: content,
      ),
      actions: actions,
    );
  }
}
