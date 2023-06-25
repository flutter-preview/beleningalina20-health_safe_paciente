import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:health_safe_paciente/src/services/api/models/models.dart';
import 'package:provider/provider.dart';
import 'package:health_safe_paciente/src/services/api/api.dart';
import 'package:health_safe_paciente/src/views/pages/pages.dart';
import 'package:health_safe_paciente/src/views/providers/providers.dart';
import 'package:health_safe_paciente/src/theme/themes.dart';
import 'package:health_safe_paciente/src/views/widgets/widgets.dart';
import 'package:health_safe_paciente/src/extensions/extensions.dart';

class RegistroUsuarioPage extends StatelessWidget {
  static const String routeName = "RegistoUsuarioPage";
  const RegistroUsuarioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: RegistroAppbar(
              title: "Registro de usuario",
              onPressed: () {} // TODO Mostrar ayuda
              ),
          backgroundColor: ColorsApp.azulLogin,
          body: MultiProvider(providers: [
            ChangeNotifierProvider(
                create: (_) => RegistroUsuarioFormProvider()),
          ], child: const _RegistroUsuarioForm())),
    );
  }
}

class _RegistroUsuarioForm extends StatelessWidget {
  const _RegistroUsuarioForm();

  @override
  Widget build(BuildContext context) {
    final registroUsuarioFormProvider =
        Provider.of<RegistroUsuarioFormProvider>(context);

    return Form(
      key: registroUsuarioFormProvider.formKey,
      autovalidateMode: AutovalidateMode.disabled,
      child: Column(
        children: [
          Expanded(
            child: Theme(
              data: ThemeData(
                  canvasColor: ColorsApp.azulLogin,
                  shadowColor: Colors.transparent),
              child: Stepper(
                // https://morioh.com/p/39c674119b0f
                margin: const EdgeInsets.all(0),
                currentStep: registroUsuarioFormProvider.pasoActual,
                onStepCancel: () {
                  if (registroUsuarioFormProvider.pasoActual > 0) {
                    registroUsuarioFormProvider.pasoActual--;
                  }
                },
                onStepContinue: () {
                  if (registroUsuarioFormProvider.pasoActual < 2) {
                    registroUsuarioFormProvider.pasoActual++;
                  }
                },
                onStepTapped: (step) =>
                    registroUsuarioFormProvider.pasoActual = step,
                controlsBuilder:
                    (BuildContext context, ControlsDetails details) {
                  return Container();
                },
                physics: const BouncingScrollPhysics(),
                type: StepperType.horizontal,
                steps: [
                  Step(
                      title: Text(
                          (registroUsuarioFormProvider.pasoActual == 0)
                              ? "Datos del usuario"
                              : "",
                          style: const TextStyle(color: Colors.white)),
                      state: (registroUsuarioFormProvider.pasoActual > 0)
                          ? StepState.complete
                          : StepState.indexed,
                      isActive: registroUsuarioFormProvider.pasoActual >= 0,
                      content: const _DatosUsuario()),
                  Step(
                      title: Text(
                          (registroUsuarioFormProvider.pasoActual == 1)
                              ? "Datos personales"
                              : "",
                          style: const TextStyle(color: Colors.white)),
                      state: (registroUsuarioFormProvider.pasoActual > 1)
                          ? StepState.complete
                          : StepState.indexed,
                      isActive: registroUsuarioFormProvider.pasoActual >= 1,
                      content: const _DatosPersonales()),
                  Step(
                      title: Text(
                          (registroUsuarioFormProvider.pasoActual == 2)
                              ? "Imagenes DNI"
                              : "",
                          style: const TextStyle(color: Colors.white)),
                      state: (registroUsuarioFormProvider.pasoActual > 2)
                          ? StepState.complete
                          : StepState.indexed,
                      isActive: registroUsuarioFormProvider.pasoActual >= 2,
                      content: const _ImagenesDni()),
                ],
              ),
            ),
          ),
          const _DeclaracionTerminosCondiciones(),
          (registroUsuarioFormProvider.isLoading)
              ? Padding(
                  padding: EdgeInsets.all(Dimens.dimens20),
                  child: const CircularProgressIndicator())
              : ElevatedButtonCustom(
                  margin: EdgeInsets.all(Dimens.dimens20),
                  onPressed: (registroUsuarioFormProvider.isValidForm())
                      ? () async {
                          FocusScope.of(context).unfocus();

                          if (registroUsuarioFormProvider.esMayorEdad()) {
                            registroUsuarioFormProvider.isLoading = true;

                            await registro(context).whenComplete(() =>
                                registroUsuarioFormProvider.isLoading = false);
                          } else {
                            // TODO Error debe ser mayor de edad
                          }
                        }
                      : () {
                          FocusScope.of(context).unfocus();
                          if (registroUsuarioFormProvider.pasoActual == 2) {
                            registroUsuarioFormProvider.pasoActual = 0;
                          } else {
                            registroUsuarioFormProvider.pasoActual++;
                          }
                        },
                  text: (registroUsuarioFormProvider.isValidForm())
                      ? "Registrarse"
                      : "Continuar",
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.blue,
                )
        ],
      ),
    );
  }

  Future<void> registro(BuildContext context) async {
    final registroUsuarioFormProvider =
        Provider.of<RegistroUsuarioFormProvider>(context, listen: false);

    RegistroUsuarioRequest request = RegistroUsuarioRequest(
        correo: registroUsuarioFormProvider.correo,
        contrasena: registroUsuarioFormProvider.contrasena,
        dni: registroUsuarioFormProvider.dni,
        nombre: registroUsuarioFormProvider.nombre,
        apellido: registroUsuarioFormProvider.apellido,
        fechaNacimiento: registroUsuarioFormProvider.fechaNacimiento!,
        sexo: registroUsuarioFormProvider.sexo,
        imagenPerfil: registroUsuarioFormProvider.imagenPerfil!,
        imagenDniFrente: registroUsuarioFormProvider.imagenDniFrente!,
        imagenDniDorso: registroUsuarioFormProvider.imagenDniDorso!);

    await UsuarioService()
        .registro(request)
        .then((value) => Navigator.pushReplacementNamed(
            context, RegistroPacientePage.routeName))
        .onError((error, stackTrace) {
      // TODO Error en el registro del usuario
      return null;
    });
  }
}

class _DatosUsuario extends StatelessWidget {
  const _DatosUsuario();

  @override
  Widget build(BuildContext context) {
    final registroUsuarioFormProvider =
        Provider.of<RegistroUsuarioFormProvider>(context, listen: true);

    return Column(
      children: [
        EmailTextFormField(
          onChanged: (String value) =>
              registroUsuarioFormProvider.correo = value,
          validator: registroUsuarioFormProvider.correoValidator,
        ),
        SizedBox(height: Dimens.dimens30),
        ContrasenaTextFormField(
          value: registroUsuarioFormProvider.contrasena,
          onChanged: (String value) =>
              registroUsuarioFormProvider.contrasena = value,
          validator: registroUsuarioFormProvider.contrasenaValidator,
          withMaxLenght: true,
        ),
        SizedBox(height: Dimens.dimens30),
        ImagenPerfil(
            onChanged: (value) =>
                registroUsuarioFormProvider.imagenPerfil = value,
            imagenPerfil: registroUsuarioFormProvider.imagenPerfil)
      ],
    );
  }
}

class _DatosPersonales extends StatelessWidget {
  const _DatosPersonales();

  @override
  Widget build(BuildContext context) {
    final registroUsuarioFormProvider =
        Provider.of<RegistroUsuarioFormProvider>(context, listen: true);

    return Column(
      children: [
        BasicTextFormField(
          hintText: 'Nombre',
          onChanged: (value) => registroUsuarioFormProvider.nombre = value,
        ),
        SizedBox(height: Dimens.dimens30),
        BasicTextFormField(
          hintText: 'Apellido',
          onChanged: (value) => registroUsuarioFormProvider.apellido = value,
        ),
        SizedBox(height: Dimens.dimens30),
        NumericTextFormField(
            hintText: 'DNI',
            onChanged: (value) => registroUsuarioFormProvider.dni = value,
            validator: registroUsuarioFormProvider.dniValidator,
            maxLength: 8),
        SizedBox(height: Dimens.dimens30),
        Theme(
          data: ThemeData(canvasColor: Colors.white),
          child: DropDownButtonCustom<String>(
            label: 'Sexo',
            labelColor: Colors.white,
            items: registroUsuarioFormProvider.sexos,
            value: registroUsuarioFormProvider.sexo,
            onChanged: (value) =>
                registroUsuarioFormProvider.sexo = value ?? 'Femenino',
          ),
        ),
        SizedBox(height: Dimens.dimens30),
        DateTimeTextFormField(
          controller: TextEditingController(
              text: registroUsuarioFormProvider.fechaNacimiento
                  ?.convertToString()),
          onChanged: (DateTime? value) {
            registroUsuarioFormProvider.fechaNacimiento = value;
          },
          hintText: 'Fecha de nacimiento',
        )
      ],
    );
  }
}

class _ImagenesDni extends StatelessWidget {
  const _ImagenesDni();

  @override
  Widget build(BuildContext context) {
    final registroUsuarioFormProvider =
        Provider.of<RegistroUsuarioFormProvider>(context, listen: true);

    return Column(
      children: [
        ImagenDni(
            label: 'Imagen DNI frente',
            imagenDni: registroUsuarioFormProvider.imagenDniFrente,
            imagenPlaceholder: const AssetImage('assets/imgs/dni_frente.png'),
            onChanged: (value) =>
                registroUsuarioFormProvider.imagenDniFrente = value),
        SizedBox(height: Dimens.dimens30),
        ImagenDni(
            label: 'Imagen DNI dorso',
            imagenDni: registroUsuarioFormProvider.imagenDniDorso,
            imagenPlaceholder: const AssetImage('assets/imgs/dni_dorso.png'),
            onChanged: (value) =>
                registroUsuarioFormProvider.imagenDniDorso = value)
      ],
    );
  }
}

class _DeclaracionTerminosCondiciones extends StatelessWidget {
  const _DeclaracionTerminosCondiciones();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Dimens.dimens20),
      child: Text.rich(
        TextSpan(
            text: "Al registrarme, acepto los ",
            style: TextStyle(fontSize: Dimens.dimens18, color: Colors.white),
            children: [
              TextSpan(
                  text: "términos y condiciones ",
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      // Todo Navegar a los terminos y condiciones
                    },
                  style: TextStyle(
                      fontSize: Dimens.dimens18,
                      color: Colors.lightBlue,
                      decoration: TextDecoration.underline)),
              TextSpan(
                  text: " y ",
                  style: TextStyle(
                      fontSize: Dimens.dimens18, color: Colors.white)),
              TextSpan(
                text: "politicas de privacidad ",
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    // Todo Navegar a las politicas de privacidad
                  },
                style: TextStyle(
                    fontSize: Dimens.dimens18,
                    color: Colors.lightBlue,
                    decoration: TextDecoration.underline),
              ),
              TextSpan(
                  text: "de Health Safe",
                  style:
                      TextStyle(fontSize: Dimens.dimens18, color: Colors.white))
            ]),
        textAlign: TextAlign.center,
      ),
    );
  }
}
