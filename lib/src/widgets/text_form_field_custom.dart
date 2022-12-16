import 'package:flutter/material.dart';
import 'package:health_safe_paciente/src/helpers/helpers.dart';

class TextFormFieldCustom extends StatelessWidget {
  final bool isPassword;
  final TextInputType keyboardType;
  final String text;

  final void Function(String)? onChanged;
  final String? Function(String?)? validator;

  const TextFormFieldCustom({
    super.key,
    required this.text,
    this.isPassword = false,
    this.keyboardType = TextInputType.name,
    required this.onChanged,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.height * 0.03,
          vertical: SizeConfig.height * 0.005),
      decoration: BoxDecoration(
          color: Colors.white,
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
    );
  }
}
