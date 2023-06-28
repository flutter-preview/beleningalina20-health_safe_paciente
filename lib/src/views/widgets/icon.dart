import 'package:flutter/material.dart';
import 'package:health_safe_paciente/src/theme/themes.dart';
import 'package:health_safe_paciente/src/views/widgets/text.dart';

class IconButtonText extends StatelessWidget {
  final Function()? onTap;
  final IconData icon;
  final String title;

  const IconButtonText(
      {Key? key, this.onTap, required this.icon, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Icon(icon, color: Colors.blue, size: Dimens.dimens50),
          SubdescriptionText(text: title)
        ],
      ),
    );
  }
}

class SuccessIcon extends StatelessWidget {
  const SuccessIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return const Icon(Icons.sentiment_satisfied_alt_rounded,
        color: Colors.green);
  }
}

class FailureIcon extends StatelessWidget {
  const FailureIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return const Icon(Icons.sentiment_dissatisfied_rounded,
        color: Colors.orange);
  }
}

class EmptyIcon extends StatelessWidget {
  const EmptyIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return const Icon(Icons.sentiment_neutral_rounded, color: Colors.grey);
  }
}

class GradientIcon extends StatelessWidget {
  final Widget? icon;
  const GradientIcon({super.key, this.icon});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
        shaderCallback: (Rect bounds) {
          return const LinearGradient(
            colors: [
              ColorsApp.azulBusqueda,
              ColorsApp.celesteFondo,
              ColorsApp.azulBusqueda,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ).createShader(bounds);
        },
        child: icon);
  }
}
