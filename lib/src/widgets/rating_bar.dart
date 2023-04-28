import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:health_safe_paciente/src/theme/themes.dart';
import 'package:health_safe_paciente/src/widgets/widgets.dart';

class RatingBar extends StatelessWidget {
  final double calificacion;
  final int numeroOpiniones;
  final void Function()? onPressed;
  const RatingBar(
      {super.key,
      required this.calificacion,
      required this.numeroOpiniones,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RatingBarIndicator(
            itemPadding: EdgeInsets.symmetric(vertical: Dimens.dimens10),
            rating: calificacion / 1,
            itemBuilder: (context, index) =>
                const Icon(Icons.star, color: Colors.cyan),
            itemCount: 5,
            itemSize: SizeConfig.height * 0.03,
            direction: Axis.horizontal),
        TextButtonCustom(
          foregroundColor: Colors.blue,
          onPressed: onPressed ?? () {},
          text: "$numeroOpiniones opiniones",
        )
      ],
    );
  }
}
