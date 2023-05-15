import 'package:flutter/material.dart';
import 'package:health_safe_paciente/src/theme/themes.dart';
import 'package:health_safe_paciente/src/views/widgets/text.dart';

class IconButtonText extends StatelessWidget {
  final Function()? onTap;
  final IconData icon;
  final String title;

  const IconButtonText(
      {Key? key, this.onTap, required this.icon, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Icon(icon, color: Colors.blue, size: Dimens.dimens50),
          SubdescriptionText(text: title)
        ],
      ),
    );
  }
}
