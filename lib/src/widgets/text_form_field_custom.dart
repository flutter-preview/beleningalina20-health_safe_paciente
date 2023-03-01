import 'package:flutter/material.dart';
import 'package:health_safe_paciente/src/helpers/helpers.dart';
import 'package:health_safe_paciente/src/widgets/text_custom.dart';

class TextFormFieldCustom extends StatelessWidget {
  String value;

  final bool isPassword;
  final TextInputType keyboardType;
  final String? label;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final Color labelColor;
  final bool withBorder;
  final bool readOnly;
  final bool enabled;
  final AutovalidateMode? autovalidateMode;

  TextFormFieldCustom(
      {super.key,
      required this.value,
      this.label,
      this.isPassword = false,
      this.keyboardType = TextInputType.name,
      this.validator,
      this.onChanged,
      this.withBorder = false,
      this.labelColor = Colors.black,
      this.onTap,
      this.readOnly = false,
      this.enabled = true,
      this.autovalidateMode = AutovalidateMode.onUserInteraction});

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController()..text = value;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) DescriptionText(text: label!, color: labelColor),
        SizedBox(height: SizeConfig.height * 0.015),
        Container(
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.height * 0.03,
              vertical: SizeConfig.height * 0.005),
          decoration: BoxDecoration(
              color: Colors.white,
              border: (withBorder) ? Border.all(color: Colors.red) : null,
              borderRadius: BorderRadius.circular(SizeConfig.height * 0.01)),
          child: TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            obscureText: isPassword,
            autocorrect: true,
            autovalidateMode: autovalidateMode,
            textCapitalization: TextCapitalization.words,
            onTap: onTap,
            autofocus: true,
            onChanged: onChanged,
            validator: validator,
            readOnly: readOnly,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(0.0),
              hintText: label,
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}
