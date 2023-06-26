import 'package:flutter/material.dart';

class StartMarkerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final blackPaint = Paint()..color = Colors.black;
    final whitePaint = Paint()..color = Colors.white;

    const double circleBlackRadius = 15;
    const double circleWhiteRadius = 10;

    canvas.drawCircle(
        Offset(circleBlackRadius, size.height - circleBlackRadius),
        circleBlackRadius,
        blackPaint);

    canvas.drawCircle(
        Offset(circleBlackRadius, size.height - circleBlackRadius),
        circleWhiteRadius,
        whitePaint);

    final path = Path();

    path.moveTo(40, 40);
    path.lineTo(size.width - 40, 40);
    path.lineTo(size.width - 40, size.height - 40);
    path.lineTo(40, size.height - 40);

    canvas.drawShadow(path, Colors.black, 10, false);

    canvas.drawPath(path, whitePaint);

    const locationText = TextSpan(
        style: TextStyle(
            color: Colors.black, fontSize: 40, fontWeight: FontWeight.normal),
        text: "Mi Ubicacion");

    final locationTextPainter = TextPainter(
        maxLines: 1,
        ellipsis: '...',
        text: locationText,
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.left)
      ..layout();

    locationTextPainter.paint(canvas, const Offset(60, 50));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(covariant CustomPainter oldDelegate) => false;
}

class EndMarkerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final blackPaint = Paint()..color = Colors.black;
    final whitePaint = Paint()..color = Colors.white;

    const double circleBlackRadius = 15;
    const double circleWhiteRadius = 10;

    canvas.drawCircle(
        Offset(size.width - circleBlackRadius, size.height - circleBlackRadius),
        circleBlackRadius,
        blackPaint);

    canvas.drawCircle(
        Offset(size.width - circleBlackRadius, size.height - circleBlackRadius),
        circleWhiteRadius,
        whitePaint);

    final path = Path();

    path.moveTo(40, 40);
    path.lineTo(size.width - 40, 40);
    path.lineTo(size.width - 40, size.height - 40);
    path.lineTo(40, size.height - 40);

    canvas.drawShadow(path, Colors.black, 10, false);

    canvas.drawPath(path, whitePaint);

    const locationText = TextSpan(
        style: TextStyle(
            color: Colors.black, fontSize: 40, fontWeight: FontWeight.normal),
        text: "Consultorio");

    final locationTextPainter = TextPainter(
        maxLines: 1,
        ellipsis: '...',
        text: locationText,
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.left)
      ..layout();

    locationTextPainter.paint(canvas, const Offset(60, 50));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(covariant CustomPainter oldDelegate) => false;
}
