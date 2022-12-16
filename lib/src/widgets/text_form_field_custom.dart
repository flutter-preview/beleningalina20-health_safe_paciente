import 'package:flutter/material.dart';
import 'package:health_safe_paciente/src/helpers/helpers.dart';

class TextFormFieldCustom extends StatelessWidget {
  final bool isPassword;
  final TextInputType keyboardType;
  final String text;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final bool withLabel;
  final Color labelColor;
  final bool withBorder;

  const TextFormFieldCustom(
      {super.key,
      required this.text,
      this.isPassword = false,
      this.keyboardType = TextInputType.name,
      required this.onChanged,
      this.validator,
      this.withLabel = false,
      this.withBorder = false,
      this.labelColor = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (withLabel)
          Text(text,
              style: Theme.of(context)
                  .textTheme
                  .bodyText2!
                  .copyWith(color: labelColor)),
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
            keyboardType: keyboardType,
            obscureText: isPassword,
            autocorrect: true,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            autofocus: true,
            onChanged: onChanged,
            validator: validator,
            decoration: InputDecoration(
              hintText: text,

              // labelText: text,

              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}
