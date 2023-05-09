import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:health_safe_paciente/src/pages/pages.dart';
import 'package:health_safe_paciente/src/services/services.dart';
import 'package:health_safe_paciente/src/providers/providers.dart';
import 'package:health_safe_paciente/src/theme/themes.dart';
import 'package:health_safe_paciente/src/widgets/widgets.dart';

class LoginPage extends StatelessWidget {
  static const String routeName = "LoginPage";
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorsApp.azulLogin,
        body: Padding(
          padding: EdgeInsets.all(Dimens.dimens20),
          child: LayoutBuilder(
            builder: (context, constraint) => SingleChildScrollView(
              // https://github.com/flutter/flutter/issues/18711
              child: ConstrainedBox(
                constraints: BoxConstraints(
                    minWidth: constraint.maxWidth,
                    minHeight: constraint.maxHeight),
                child: IntrinsicHeight(
                  child: Column(children: <Widget>[
                    const LogoHealthSafe(),
                    Expanded(
                      child: ChangeNotifierProvider(
                          create: (_) => LoginFormProvider(),
                          child: const _LoginForm()),
                    ),
                  ]),
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: const _RegistroUsuarioPage(),
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm();

  @override
  Widget build(BuildContext context) {
    final loginFormProvider = Provider.of<LoginFormProvider>(context);
    final autenticacionService = Provider.of<AutenticacionService>(context);

    return Form(
        key: loginFormProvider.formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            EmailTextFormField(
              onChanged: (String value) => loginFormProvider.correo = value,
            ),
            SizedBox(height: Dimens.dimens30),
            ContrasenaTextFormField(
              value: loginFormProvider.contrasena,
              onChanged: (String value) => loginFormProvider.contrasena = value,
            ),
            (autenticacionService.isLoading)
                ? Padding(
                    padding: EdgeInsets.all(Dimens.dimens40),
                    child: const Center(child: CircularProgressIndicator()),
                  )
                : ElevatedButtonCustom(
                    margin: EdgeInsets.only(top: Dimens.dimens40),
                    text: 'Iniciar sesión',
                    onPressed: (loginFormProvider.isValidForm())
                        ? () async {
                            FocusScope.of(context).unfocus();
                            await login(
                              context,
                              autenticacionService,
                              loginFormProvider.correo,
                              loginFormProvider.contrasena,
                            );
                          }
                        : null,
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.blue,
                  )
          ],
        ));
  }

  Future<void> login(BuildContext context, AutenticacionService service,
      String correo, String contrasena) async {
    await service.login(correo, contrasena).then(
      (_) {
        if (true) {
          // TODO validar usuario este registrado
          final socketService =
              Provider.of<SocketService>(context, listen: false);
          socketService.connect();
          Navigator.of(context).pushReplacementNamed(HomePage.routeName);
        } else {
          // TODO Navegar registro paciente
        }
      },
    ).onError((Exception error, stackTrace) {
      // TODO Login mensaje de error
    });
  }
}

class _RegistroUsuarioPage extends StatelessWidget {
  const _RegistroUsuarioPage();

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
      const DescriptionText(
          text: "¿No tienes cuenta aún?", color: Colors.white),
      TextButtonCustom(
          text: "Registraté",
          onPressed: () =>
              Navigator.of(context).pushNamed(RegistroUsuarioPage.routeName))
    ]);
  }
}
