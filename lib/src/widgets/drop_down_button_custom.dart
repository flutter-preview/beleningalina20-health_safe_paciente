import 'package:flutter/material.dart';
import 'package:health_safe_paciente/src/helpers/helpers.dart';

class DropDownButtonCustom<T> extends StatefulWidget {
  T? value;

  final String? label;
  final Color labelColor;

  final List<T> items;
  final void Function(T?)? onChanged;

  DropDownButtonCustom(
      {super.key,
      this.label,
      this.labelColor = Colors.black,
      required this.items,
      required this.value,
      this.onChanged});

  @override
  State<DropDownButtonCustom<T>> createState() =>
      _DropDownButtonCustomState<T>();
}

class _DropDownButtonCustomState<T> extends State<DropDownButtonCustom<T>> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null)
          Text(widget.label!,
              style: Theme.of(context)
                  .textTheme
                  .bodyText2!
                  .copyWith(color: widget.labelColor)),
        SizedBox(height: SizeConfig.height * 0.015),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.height * 0.03,
              vertical: SizeConfig.height * 0.005),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(SizeConfig.height * 0.01)),
          child: DropdownButtonHideUnderline(
              child: DropdownButton<T>(
                  isExpanded: true,
                  iconSize: SizeConfig.height * 0.05,
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
        )
      ],
    );
  }
}
