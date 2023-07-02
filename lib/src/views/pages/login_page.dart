import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:health_safe_paciente/src/services/api/models/models.dart';
import 'package:health_safe_paciente/src/services/api/utils/api_exceptions.dart';
import 'package:health_safe_paciente/src/services/api/api.dart';
import 'package:health_safe_paciente/src/views/pages/pages.dart';
import 'package:health_safe_paciente/src/views/providers/providers.dart';
import 'package:health_safe_paciente/src/theme/themes.dart';
import 'package:health_safe_paciente/src/views/widgets/widgets.dart';

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

    return Form(
        // TODO Que se borren los datos cuando sea login fallido
        // TODO Que se borren los datos si el usuario pasa a registro
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
            SizedBox(height: Dimens.dimens30),
            (loginFormProvider.isLoading)
                ? const Loader()
                : ElevatedButtonCustom(
                    text: 'Iniciar sesión',
                    onPressed: (loginFormProvider.isValidForm())
                        ? () async {
                            loginFormProvider.isLoading = true;
                            FocusScope.of(context).unfocus();
                            await login(
                              context,
                              LoginRequest(
                                  correo: loginFormProvider.correo.trim(),
                                  contrasena:
                                      loginFormProvider.contrasena.trim()),
                            ).whenComplete(
                                () => loginFormProvider.isLoading = false);
                          }
                        : null,
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.blue,
                  )
          ],
        ));
  }

  Future<void> login(BuildContext context, LoginRequest request) async {
    final autenticacionService =
        Provider.of<AutenticacionService>(context, listen: false);

    await autenticacionService.login(request).then(
      (_) {
        // TODO Connect Socket Service
        Navigator.of(context).pushReplacementNamed(HomePage.routeName);
      },
    ).onError((ApiException error, stackTrace) {
      showDialog(
          context: context,
          builder: (context) => const AlertDialogBackground(content: [
                DescriptionText(text: "Correo y/o contraseña incorrectos")
              ]));
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
