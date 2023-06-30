import 'package:flutter/material.dart';
import 'package:health_safe_paciente/src/views/providers/providers.dart';
import 'package:provider/provider.dart';
import 'package:health_safe_paciente/src/models/models.dart';
import 'package:health_safe_paciente/src/services/api/api.dart';
import 'package:health_safe_paciente/src/theme/themes.dart';
import 'package:health_safe_paciente/src/views/widgets/widgets.dart';

class CuentaDatosPacientePage extends StatelessWidget {
  static const String routeName = "CuentaDatosPacientePage";

  const CuentaDatosPacientePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const AppbarCustom(),
        drawer: const DrawerCustom(),
        backgroundColor: ColorsApp.celesteFondo,
        body: Column(
          children: [
            const HeaderPage(title: "Datos del paciente"),
            ChangeNotifierProvider(
                create: (context) => DatosPacienteFormProvider(),
                child: const _DatosPacienteForm()),
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

class _DatosPacienteForm extends StatelessWidget {
  const _DatosPacienteForm();

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
                _OcupacionPacienteForm(
                    ocupacion: autenticacionService.paciente?.ocupacion ?? '')
              ],
            ),
          )),
    );
  }
}

class _OcupacionPacienteForm extends StatelessWidget {
  final String ocupacion;
  const _OcupacionPacienteForm({required this.ocupacion});

  @override
  Widget build(BuildContext context) {
    final datosPacienteFormProvider =
        Provider.of<DatosPacienteFormProvider>(context);
    final autenticacionService = Provider.of<AutenticacionService>(context);

    return (!datosPacienteFormProvider.modificarOcupacion)
        ? Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            const DescriptionText(text: "Ocupación: "),
            SizedBox(width: Dimens.dimens20),
            Expanded(child: DescriptionText(text: ocupacion)),
            IconButton(
                icon: const Icon(Icons.edit, color: Colors.blue),
                onPressed: () =>
                    datosPacienteFormProvider.modificarOcupacion = true)
          ])
        : BasicTextFormField(
            hintText: 'Ocupación',
            borderColor: Colors.black,
            labelColor: Colors.black,
            onChanged: (value) => datosPacienteFormProvider.ocupacion = value,
            suffixIcon: IconButton(
                onPressed: () {
                  if (datosPacienteFormProvider.esValidaOcupacion()) {
                    if (datosPacienteFormProvider.ocupacion != '') {
                      autenticacionService.paciente?.ocupacion =
                          datosPacienteFormProvider.ocupacion!;
                    }

                    datosPacienteFormProvider.modificarOcupacion = false;
                  }
                },
                icon: (datosPacienteFormProvider.esValidaOcupacion())
                    ? const Icon(Icons.check, color: Colors.green)
                    : const Icon(Icons.close, color: Colors.red)));
  }
}
