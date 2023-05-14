import 'package:flutter/material.dart';
import 'package:health_safe_paciente/src/theme/themes.dart';
import 'package:health_safe_paciente/src/views/widgets/widgets.dart';

class DropDownButtonCustom<T> extends StatelessWidget {
  T? value;
  final String label;
  final Color labelColor;
  final List<T> items;
  final void Function(T?)? onChanged;
  final Color borderColor;
  final bool vertical;

  DropDownButtonCustom(
      {super.key,
      required this.label,
      this.labelColor = Colors.black,
      required this.items,
      required this.value,
      this.onChanged,
      this.borderColor = Colors.white,
      this.vertical = true});

  @override
  Widget build(BuildContext context) {
    return (vertical)
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DescriptionText(text: label, color: labelColor),
              SizedBox(height: Dimens.dimens10),
              DropDownMenuButton(
                items: items,
                value: value,
                borderColor: borderColor,
                onChanged: onChanged,
              )
            ],
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              DescriptionText(text: label, color: labelColor),
              SizedBox(width: Dimens.dimens10),
              Expanded(
                  child: DropDownMenuButton(
                items: items,
                value: value,
                borderColor: borderColor,
                onChanged: onChanged,
              ))
            ],
          );
  }
}

class DropDownMenuButton<T> extends StatefulWidget {
  T? value;
  final Color borderColor;
  final List<T> items;
  final void Function(T?)? onChanged;

  DropDownMenuButton(
      {super.key,
      this.borderColor = Colors.white,
      required this.items,
      required this.value,
      this.onChanged});

  @override
  State<DropDownMenuButton<T>> createState() => _DropDownMenuButtonState<T>();
}

class _DropDownMenuButtonState<T> extends State<DropDownMenuButton<T>> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: Dimens.dimens30),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: widget.borderColor),
          borderRadius: BorderRadius.circular(Dimens.dimens10)),
      child: DropdownButtonHideUnderline(
          child: DropdownButton<T>(
              isExpanded: true,
              iconSize: Dimens.dimens50,
              iconEnabledColor: Colors.blue,
              iconDisabledColor: Colors.grey[400],
              items: widget.items
                  .map((element) => DropdownMenuItem<T>(
                        value: element,
                        onTap: () => setState(() => widget.value = element),
                        child: Text(element.toString()),
                      ))
                  .toList(),
              onChanged: widget.onChanged,
              value: widget.value)),
    );
  }
}
