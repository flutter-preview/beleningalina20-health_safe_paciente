import 'package:flutter/material.dart';
import 'package:health_safe_paciente/src/theme/themes.dart';
import 'package:health_safe_paciente/src/views/widgets/widgets.dart';

class HeaderPage extends StatelessWidget {
  final String title;
  final Widget? prefixIcon;
  final Widget? sufixIcon;

  const HeaderPage({
    super.key,
    required this.title,
    this.prefixIcon,
    this.sufixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(
            vertical: (sufixIcon != null) ? Dimens.dimens5 : Dimens.dimens20,
            horizontal: Dimens.dimens10),
        color: ColorsApp.azulBusqueda,
        child: Row(
          children: [
            prefixIcon ?? Container(),
            Expanded(
                child: BodyText(
                    text: title,
                    color: Colors.white,
                    textAlign: TextAlign.center,
                    fontSize: (title.length > 32) ? Dimens.dimens20 : null)),
            sufixIcon ?? Container()
          ],
        ));
  }
}
