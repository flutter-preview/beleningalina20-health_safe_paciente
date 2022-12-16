import 'package:flutter/material.dart';
import 'package:health_safe_paciente/src/helpers/helpers.dart';

class LogoHealthSafe extends StatelessWidget {
  final Color? textColor;
  const LogoHealthSafe({Key? key, this.textColor = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(vertical: SizeConfig.height * 0.03),
        child: Column(children: <Widget>[
          Text('¡Bienvenido a Health Safe!',
              style: Theme.of(context)
                  .textTheme
                  .headline1!
                  .copyWith(color: textColor)),
          SizedBox(height: SizeConfig.height * 0.02),
          Image(
              image: const AssetImage('assets/imgs/logo_health_safe.png'),
              height: SizeConfig.height * 0.25),
          SizedBox(height: SizeConfig.height * 0.02),
          Text('Estamos aquí para cuidarte',
              style: Theme.of(context)
                  .textTheme
                  .headline2!
                  .copyWith(color: textColor))
        ]));
  }
}
