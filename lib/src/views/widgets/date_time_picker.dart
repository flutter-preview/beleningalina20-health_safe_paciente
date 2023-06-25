import 'package:flutter/material.dart';
import 'package:health_safe_paciente/src/extensions/extensions.dart';
import 'package:health_safe_paciente/src/views/widgets/widgets.dart';

class DateTimeHorizontalPicker extends StatelessWidget {
  final DateTime fechaSeleccionada;
  final List<DateTime> fechas;
  final void Function(DateTime)? onChanged;

  const DateTimeHorizontalPicker(
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
        text: fechaSeleccionada.convertToString(longFormat: true),
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
