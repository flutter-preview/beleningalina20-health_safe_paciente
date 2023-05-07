import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:health_safe_paciente/src/helpers/paint/map_marker.dart';

Future<BitmapDescriptor> getCustomMarker(CustomPainter customPainter) async {
  final recorder = ui.PictureRecorder();
  final canvas = ui.Canvas(recorder);
  const size = ui.Size(350, 150); // w, h

  customPainter.paint(canvas, size);

  final picture = recorder.endRecording();
  final image = await picture.toImage(size.width.toInt(), size.height.toInt());
  final byteData = await image.toByteData(format: ui.ImageByteFormat.png);

  return BitmapDescriptor.fromBytes(byteData!.buffer.asUint8List());
}

Future<List<BitmapDescriptor>> getMapMarkers() async {
  var startMarker = await getCustomMarker(StartMarkerPainter());
  var endMarker = await getCustomMarker(EndMarkerPainter());
  return [startMarker, endMarker];
}
