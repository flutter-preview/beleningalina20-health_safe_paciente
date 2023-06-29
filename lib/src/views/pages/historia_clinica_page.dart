import 'package:flutter/material.dart';
import 'package:health_safe_paciente/src/theme/themes.dart';
import 'package:health_safe_paciente/src/views/widgets/widgets.dart';

class HistoriaClinicaPage extends StatelessWidget {
  static const String routeName = 'HistoriaClinicaPage';
  const HistoriaClinicaPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO Que pueda recibir el id del turno, o el id del profesional
    return const SafeArea(
      child: Scaffold(
        appBar: AppbarCustom(),
        drawer: DrawerCustom(),
        backgroundColor: ColorsApp.celesteFondo,
        body: Column(
          children: [
            HeaderPage(title: "Historia Clínica"),
            Expanded(
              child: _ListadoRegistrosHistoriaClinica(),
            ),
          ],
        ),
      ),
    );
  }
}

class _ListadoRegistrosHistoriaClinica extends StatelessWidget {
  const _ListadoRegistrosHistoriaClinica();

  @override
  Widget build(BuildContext context) {
    return Container(); /*FutureStatesBuilder<List<RegistroHistoriaClinicaDto>>(
      future: HistoriaClinicaService().obtenerRegistrosHistoriaClinica(),
      onSuccess: ,
      onEmpty: ,
      onError: ,
      onNull: ,
    );*/
  }
}
