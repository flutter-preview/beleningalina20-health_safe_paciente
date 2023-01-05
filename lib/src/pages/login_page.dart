import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:health_safe_paciente/src/pages/pages.dart';
import 'package:health_safe_paciente/src/providers/providers.dart';
import 'package:health_safe_paciente/src/helpers/helpers.dart';
import 'package:health_safe_paciente/src/services/services.dart';
import 'package:health_safe_paciente/src/theme/themes.dart';
import 'package:health_safe_paciente/src/widgets/widgets.dart';

class LoginPage extends StatelessWidget {
  static const String routeName = 'LoginPage';
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig(context); // TODO pasar a LoadingPage

    // TODO Bug: Cuando se carga la pagina se abre el teclado sin haber seleccionado ningun text field

    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorsApp.azulLogin,
            body: Padding(
              padding: EdgeInsets.all(SizeConfig.height * 0.02),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    const LogoHealthSafe(),
                    ChangeNotifierProvider(
                        create: (_) => LoginProvider(), child: _FormLogin()),
                    _RegistroUsuarioBoton()
                  ],
                ),
              ),
            )));
  }
}

class _FormLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);
    final autenticacionService = Provider.of<AutenticacionService>(context);

    return Container(
      margin: EdgeInsets.symmetric(
          vertical: SizeConfig.height * 0.015,
          horizontal: SizeConfig.height * 0.015),
      child: Form(
        key: loginProvider.formKey,
        child: Column(
          children: [
            TextFormFieldCustom(
                label: 'Correo',
                labelColor: Colors.white,
                keyboardType: TextInputType.emailAddress,
                value: loginProvider.correo,
                validator: (String? value) =>
                    (value != '') ? null : 'Ingrese su correo'),
            SizedBox(height: SizeConfig.height * 0.03),
            TextFormFieldCustom(
                label: 'Contraseña',
                labelColor: Colors.white,
                isPassword: true,
                value: loginProvider.contrasena,
                validator: (String? value) =>
                    (value != '') ? null : 'Ingrese su contraseña'),
            SizedBox(height: SizeConfig.height * 0.03),
            ElevatedButtonCustom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.blue,
                onPressed: (!loginProvider.isLoading)
                    ? () async {
                        // TODO validar form & login

                        Navigator.pushReplacementNamed(
                            context, HomePage.routeName);
                      }
                    : () {},
                text: 'Iniciar Sesión'),
            if (autenticacionService.isLoading)
              const CircularProgressIndicator()
          ],
        ),
      ),
    );
  }
}

class _RegistroUsuarioBoton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text('¿No tienes cuenta aún?',
          style: Theme.of(context)
              .textTheme
              .button!
              .copyWith(color: Colors.white)),
      TextButton(
          onPressed: () =>
              Navigator.pushNamed(context, RegistroUsuarioPage.routeName),
          child: const Text('Registrate'))
    ]);
  }
}
