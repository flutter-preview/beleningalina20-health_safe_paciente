import 'package:flutter/material.dart';
import 'package:health_safe_paciente/src/theme/themes.dart';
import 'package:health_safe_paciente/src/widgets/widgets.dart';

class LogoHealthSafe extends StatelessWidget {
  final Color textColor;
  const LogoHealthSafe({Key? key, this.textColor = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(vertical: Dimens.dimens30),
        child: Column(children: <Widget>[
          TitleText(text: '¡Bienvenido a Health Safe!', color: textColor),
          SizedBox(height: Dimens.dimens20),
          Image(
              image: const AssetImage('assets/imgs/logo_health_safe.png'),
              height: Dimens.dimens250),
          SizedBox(height: Dimens.dimens20),
          SubtitleText(text: 'Estamos aquí para cuidarte', color: textColor)
        ]));
  }
}
