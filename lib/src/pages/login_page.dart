import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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

    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorsApp.azulLogin,
            body: Padding(
              padding: EdgeInsets.all(SizeConfig.height * 0.02),
              child: Center(
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
      margin: EdgeInsets.symmetric(vertical: SizeConfig.height * 0.015),
      child: Form(
        key: loginProvider.formKey,
        child: Column(
          children: [
            TextFormFieldCustom(
                text: 'Correo',
                keyboardType: TextInputType.emailAddress,
                onChanged: (String value) => loginProvider.correo = value,
                validator: (String? value) =>
                    (value != '') ? null : 'Ingrese su correo'),
            SizedBox(height: SizeConfig.height * 0.03),
            TextFormFieldCustom(
                text: 'Contraseña',
                isPassword: true,
                onChanged: (String value) => loginProvider.contrasena = value,
                validator: (String? value) =>
                    (value != '') ? null : 'Ingrese su contraseña'),
            ElevatedButtonCustom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.blue,
                onPressed: (!loginProvider.isLoading)
                    ? () async {
                        FocusScope.of(context).unfocus();

                        if (!loginProvider.isValidForm()) return;

                        loginProvider.isLoading = true;

                        bool resp = await autenticacionService.login(
                            loginProvider.correo, loginProvider.contrasena);

                        if (resp) {
                          // Navegar a home
                          // Conectar socket
                        } else {
                          // Mensaje de error
                        }
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
          onPressed: () {
            // TODO Navegar a Registro de usuario
          },
          child: const Text('Registrate'))
    ]);
  }
}


/**
 * /*String pattern =
                      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                  RegExp regExp = RegExp(pattern);

                  return regExp.hasMatch(value ?? '')
                      ? null
                      : 'Ingrese un correo valido';*/
 * 
 */