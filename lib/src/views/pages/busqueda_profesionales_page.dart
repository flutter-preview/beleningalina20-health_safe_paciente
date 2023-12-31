import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:health_safe_paciente/src/models/models.dart';
import 'package:health_safe_paciente/src/services/api/api.dart';
import 'package:health_safe_paciente/src/views/pages/pages.dart';
import 'package:health_safe_paciente/src/views/providers/providers.dart';
import 'package:health_safe_paciente/src/theme/themes.dart';
import 'package:health_safe_paciente/src/views/widgets/widgets.dart';

class BusquedaProfesionalesPage extends StatelessWidget {
  static const String routeName = "BusquedaProfesionalesPage";
  const BusquedaProfesionalesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: const AppbarCustom(),
            backgroundColor: ColorsApp.azulBusqueda,
            body: Padding(
                padding: EdgeInsets.all(Dimens.dimens20),
                child: Column(
                  children: [
                    const BusquedaProfesionalesTitulo(),
                    ChangeNotifierProvider(
                        create: (_) => BusquedaProfesionalesProvider(),
                        child: const FiltrosBusquedaProfesionales())
                  ],
                )),
            drawer: const DrawerCustom()));
  }
}

class BusquedaProfesionalesTitulo extends StatelessWidget {
  const BusquedaProfesionalesTitulo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      const TitleText(
              text: "SACAR TURNO",
              textAlign: TextAlign.center,
              color: Colors.white,
              fontWeight: FontWeight.bold)
          .withPrefixIcon(Icons.note_alt_outlined),
      Padding(
        padding: EdgeInsets.symmetric(vertical: Dimens.dimens20),
        child: const BodyText(
            text:
                'Más de 1000 profesionales están aquí para ayudarte. Encontra a los especialistas de tu ciudad y solicita el turno que más te convenga',
            color: Colors.white,
            textAlign: TextAlign.center),
      )
    ]);
  }
}

class FiltrosBusquedaProfesionales extends StatelessWidget {
  const FiltrosBusquedaProfesionales({super.key});

  @override
  Widget build(BuildContext context) {
    final busquedaProfesionalesProvider =
        Provider.of<BusquedaProfesionalesProvider>(context);

    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Filtros(),
          SizedBox(height: Dimens.dimens30),
          ElevatedButtonCustom(
              text: "Buscar profesionales",
              onPressed: (busquedaProfesionalesProvider.esValidaBusqueda())
                  ? () => Navigator.pushNamed(
                          context, ListadoProfesionalesPage.routeName,
                          arguments: {
                            'especialidad':
                                busquedaProfesionalesProvider.especialidad,
                            'modalidadAtencion':
                                busquedaProfesionalesProvider.modalidadAtencion,
                            'localidad': (busquedaProfesionalesProvider
                                        .modalidadAtencion?.descripcion ==
                                    "Presencial")
                                ? busquedaProfesionalesProvider.localidad
                                : null
                          })
                  : null,
              backgroundColor: Colors.white,
              foregroundColor: ColorsApp.azulBusqueda)
        ],
      ),
    );
  }
}

class Filtros extends StatelessWidget {
  const Filtros({super.key});

  @override
  Widget build(BuildContext context) {
    final busquedaProfesionalesProvider =
        Provider.of<BusquedaProfesionalesProvider>(context);

    return Column(
      children: [
        const MenuEspecialidades(),
        SizedBox(height: Dimens.dimens30),
        const MenuModalidadesAtencion(),
        SizedBox(height: Dimens.dimens30),
        (busquedaProfesionalesProvider.modalidadAtencion?.descripcion ==
                "Presencial")
            ? const MenuLocalidades()
            : Container()
      ],
    );
  }
}

class MenuEspecialidades extends StatelessWidget {
  const MenuEspecialidades({super.key});

  @override
  Widget build(BuildContext context) {
    final busquedaProfesionalesProvider =
        Provider.of<BusquedaProfesionalesProvider>(context);

    return FutureStatesBuilder<List<EspecialidadDto>?>(
        future: EspecialidadService.especialidadService.especialidades,
        someAction: (value) {
          return DropDownButtonCustom<EspecialidadDto>(
            label: 'Especialidad',
            labelColor: Colors.white,
            items: value ?? [],
            value: busquedaProfesionalesProvider.especialidad,
            onChanged: (value) =>
                busquedaProfesionalesProvider.especialidad = value,
          );
        });
  }
}

class MenuModalidadesAtencion extends StatelessWidget {
  const MenuModalidadesAtencion({super.key});

  @override
  Widget build(BuildContext context) {
    final busquedaProfesionalesProvider =
        Provider.of<BusquedaProfesionalesProvider>(context);

    return FutureStatesBuilder<List<ModalidadAtencionDto>?>(
        future: ModalidadAtencionService
            .modalidadAtencionService.modalidadesAtencion,
        someAction: (value) {
          return DropDownButtonCustom<ModalidadAtencionDto>(
            label: 'Modalidad Atención',
            labelColor: Colors.white,
            items: value ?? [],
            value: busquedaProfesionalesProvider.modalidadAtencion,
            onChanged: (value) =>
                busquedaProfesionalesProvider.modalidadAtencion = value,
          );
        });
  }
}

class MenuLocalidades extends StatelessWidget {
  const MenuLocalidades({super.key});

  @override
  Widget build(BuildContext context) {
    final busquedaProfesionalesProvider =
        Provider.of<BusquedaProfesionalesProvider>(context);

    return FutureStatesBuilder<List<LocalidadDto>?>(
        future: LocalidadService.localidadService.localidades,
        someAction: (value) {
          return DropDownButtonCustom<LocalidadDto>(
            label: 'Localidad',
            labelColor: Colors.white,
            items: value ?? [],
            value: busquedaProfesionalesProvider.localidad,
            onChanged: (value) =>
                busquedaProfesionalesProvider.localidad = value,
          );
        });
  }
}
