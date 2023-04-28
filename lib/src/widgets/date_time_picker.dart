import 'package:flutter/material.dart';
import 'package:health_safe_paciente/src/helpers/functions/extensions.dart';
import 'package:health_safe_paciente/src/widgets/widgets.dart';

class DateTimePicker extends StatelessWidget {
  final DateTime fechaSeleccionada;
  final List<DateTime> fechas;
  final void Function(DateTime)? onChanged;

  const DateTimePicker(
      {super.key,
      required this.fechas,
      required this.fechaSeleccionada,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      IconButton(
          icon: const Icon(Icons.arrow_back_ios_sharp, color: Colors.grey),
          onPressed: () {
            var index = fechas.indexWhere(
                (element) => element.isAtSameMomentAs(fechaSeleccionada));
            if (index > 0) {
              index--;
              DateTime fecha = fechas[index];
              if (onChanged != null) onChanged!(fecha);
            }
          }),
      DescriptionText(
        text: fechaSeleccionada.convertDateTimeToLongFormat(),
        textAlign: TextAlign.center,
      ),
      IconButton(
          icon: const Icon(Icons.arrow_forward_ios_sharp, color: Colors.grey),
          onPressed: () {
            var index = fechas.indexWhere(
                (element) => element.isAtSameMomentAs(fechaSeleccionada));
            if (index < fechas.length - 1) {
              index++;
              DateTime fecha = fechas[index];
              if (onChanged != null) onChanged!(fecha);
            }
          })
    ]);
  }
}
