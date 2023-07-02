import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:health_safe_paciente/src/theme/themes.dart';
import 'package:health_safe_paciente/src/views/widgets/widgets.dart';

class RatingBarIndicatorCustom extends StatelessWidget {
  final double calificacion;
  final int cantidadCalificaciones;

  const RatingBarIndicatorCustom({
    super.key,
    required this.calificacion,
    required this.cantidadCalificaciones,
  });

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
        SizedBox(width: Dimens.dimens10),
        DescriptionText(
          color: Colors.blue,
          text: "$cantidadCalificaciones opiniones",
        )
      ],
    );
  }
}

class RatingBarTextField extends StatelessWidget {
  final double rating;
  final Function(double) onRatingUpdate;
  const RatingBarTextField(
      {super.key, required this.rating, required this.onRatingUpdate});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const DescriptionText(
          text: "Mi calificacion",
          textAlign: TextAlign.center,
          color: Colors.white,
        ),
        SizedBox(height: Dimens.dimens10),
        _RatingBarTextField(rating: rating, onRatingUpdate: onRatingUpdate),
      ],
    );
  }
}

class _RatingBarTextField extends StatelessWidget {
  final double rating;
  final Function(double) onRatingUpdate;

  const _RatingBarTextField(
      {required this.rating, required this.onRatingUpdate});

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: rating,
      minRating: 0.0,
      maxRating: 5.0,
      direction: Axis.horizontal,
      allowHalfRating: false,
      itemCount: 5,
      itemPadding: EdgeInsets.symmetric(vertical: Dimens.dimens10),
      itemSize: SizeConfig.height * 0.04,
      itemBuilder: (context, index) =>
          const Icon(Icons.star, color: Colors.cyan),
      onRatingUpdate: onRatingUpdate,
    );
  }
}
