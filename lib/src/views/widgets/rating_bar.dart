import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:health_safe_paciente/src/theme/themes.dart';
import 'package:health_safe_paciente/src/views/widgets/widgets.dart';
import 'package:provider/provider.dart';

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
          text: "$cantidadCalificaciones calificaciones",
        )
      ],
    );
  }
}

class RatingBarTextField extends StatelessWidget {
  final void Function(double)? onUpdated;
  const RatingBarTextField({super.key, this.onUpdated});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RatingBarTextFieldProvider(),
      child: _RatingBarTextField(onUpdated: onUpdated),
    );
  }
}

class _RatingBarTextField extends StatelessWidget {
  final void Function(double)? onUpdated;

  const _RatingBarTextField({this.onUpdated});

  @override
  Widget build(BuildContext context) {
    final ratingBarProvider = Provider.of<RatingBarTextFieldProvider>(context);

    return RatingBar.builder(
      initialRating: ratingBarProvider.rating,
      minRating: 0.0,
      maxRating: 5.0,
      direction: Axis.horizontal,
      allowHalfRating: false,
      itemCount: 5,
      itemPadding: EdgeInsets.symmetric(vertical: Dimens.dimens10),
      itemSize: SizeConfig.height * 0.04,
      itemBuilder: (context, index) =>
          const Icon(Icons.star, color: Colors.cyan),
      onRatingUpdate: (value) {
        ratingBarProvider.rating = value;
        if (onUpdated != null) onUpdated!(value);
      },
    );
  }
}

class RatingBarTextFieldProvider extends ChangeNotifier {
  double _rating = 0.0;

  double get rating => _rating;
  set rating(double value) {
    _rating = value;
    notifyListeners();
  }
}
