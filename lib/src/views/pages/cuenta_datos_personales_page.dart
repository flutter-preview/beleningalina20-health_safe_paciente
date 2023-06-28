import 'package:flutter/material.dart';
import 'package:health_safe_paciente/src/extensions/extensions.dart';
import 'package:health_safe_paciente/src/services/api/api.dart';
import 'package:health_safe_paciente/src/theme/themes.dart';
import 'package:health_safe_paciente/src/views/widgets/widgets.dart';
import 'package:provider/provider.dart';

class CuentaDatosPersonalesPage extends StatelessWidget {
  static const String routeName = "CuentaDatosPersonalesPage";

  const CuentaDatosPersonalesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const AppbarCustom(),
        drawer: const DrawerCustom(),
        backgroundColor: ColorsApp.celesteFondo,
        body: Column(
          children: [
            HeaderPage(
                title: "Datos personales",
                sufixIcon: IconButton(
                    onPressed: () => showDialog(
                        context: context,
                        builder: (context) => const AlertDialogBackground(
                              alignment: Alignment.centerLeft,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              content: [
                                DescriptionText(
                                    text:
                                        "Aquí puede revisar sus datos personales que guardo durante su registro"),
                              ],
                            )),
                    icon: const Icon(Icons.help, color: Colors.white))),
            const _DatosPersonalesForm(),
            ElevatedButtonCustom(
                margin: EdgeInsets.all(Dimens.dimens20),
                text: "Finalizar",
                onPressed: () => Navigator.pop(context))
          ],
        ),
      ),
    );
  }
}

class _DatosPersonalesForm extends StatelessWidget {
  const _DatosPersonalesForm();

  @override
  Widget build(BuildContext context) {
    final autenticacionService = Provider.of<AutenticacionService>(context);
    return Expanded(
      child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(Dimens.dimens10)),
          width: double.infinity,
          margin: EdgeInsets.all(Dimens.dimens20),
          padding: EdgeInsets.all(Dimens.dimens20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _DatosPersonalesUsuario(
                    label: "Nombre",
                    datoUsuario: autenticacionService.usuario!.nombre),
                SizedBox(height: Dimens.dimens20),
                _DatosPersonalesUsuario(
                    label: "Apellido",
                    datoUsuario: autenticacionService.usuario!.apellido),
                SizedBox(height: Dimens.dimens20),
                _DatosPersonalesUsuario(
                    label: "Fecha de nacimiento",
                    datoUsuario: autenticacionService.usuario!.fechaNacimiento!
                        .convertToString()),
                SizedBox(height: Dimens.dimens20),
                _DatosPersonalesUsuario(
                    label: "DNI",
                    datoUsuario: autenticacionService.usuario!.dni.toString()),
                SizedBox(height: Dimens.dimens20),
                _DatosPersonalesUsuario(
                    label: "Sexo",
                    datoUsuario: (autenticacionService.usuario!.sexo == "F")
                        ? "Femenino"
                        : "Masculino"),
                SizedBox(height: Dimens.dimens20),
                ImagenDni(
                    labelColor: Colors.black,
                    urlImagenDni:
                        autenticacionService.usuario?.urlImagenDniFrente,
                    imagenPlaceholder:
                        const AssetImage('assets/imgs/dni_frente.png'),
                    label: 'Imagen DNI frente'),
                SizedBox(height: Dimens.dimens20),
                ImagenDni(
                    labelColor: Colors.black,
                    urlImagenDni:
                        autenticacionService.usuario?.urlImagenDniDorso,
                    imagenPlaceholder:
                        const AssetImage('assets/imgs/dni_dorso.png'),
                    label: 'Imagen DNI dorso'),
              ],
            ),
          )),
    );
  }
}

class _DatosPersonalesUsuario extends StatelessWidget {
  final String label;
  final String datoUsuario;
  const _DatosPersonalesUsuario(
      {required this.label, required this.datoUsuario});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
      DescriptionText(text: "$label: "),
      SizedBox(width: Dimens.dimens20),
      DescriptionText(text: datoUsuario),
    ]);
  }
}
