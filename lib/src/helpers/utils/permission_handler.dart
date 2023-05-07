import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionHandler extends ChangeNotifier {
  bool _isGpsEnabled = false;
  bool _isGpsPermissionGranted = false;
  Position? currentPosition;

  bool get isGpsEnabled => _isGpsEnabled;
  set isGpsEnabled(bool value) {
    _isGpsEnabled = value;
    notifyListeners();
  }

  bool get isGpsPermissionGranted => _isGpsPermissionGranted;
  set isGpsPermissionGranted(bool value) {
    _isGpsPermissionGranted = value;
    notifyListeners();
  }

  StreamSubscription? gpsServiceSubscripcion;

  PermissionHandler() {
    _init();
  }

  Future<void> _init() async {
    isGpsEnabled = await _checkGpsStatus();
    isGpsPermissionGranted = await _isPermissionGranted();

    if (isGpsEnabled && isGpsPermissionGranted) {
      currentPosition = await _getCurrentPosition();
      notifyListeners();
    }
  }

  Future<bool> _checkGpsStatus() async {
    final isEnabled = await Geolocator.isLocationServiceEnabled();

    gpsServiceSubscripcion =
        Geolocator.getServiceStatusStream().listen((event) {
      final isEnabled = (event.index == 1) ? true : false;
      isGpsEnabled = isEnabled;
    });

    return isEnabled;
  }

  Future<bool> _isPermissionGranted() async {
    return await Permission.location.isGranted.then((value) => value);
  }

  void askGpsAccess() async {
    await Permission.location.request().then((value) {
      switch (value) {
        case PermissionStatus.denied:
        case PermissionStatus.limited:
        case PermissionStatus.permanentlyDenied:
        case PermissionStatus.restricted:
          isGpsPermissionGranted = false;
          openAppSettings();
          break;

        case PermissionStatus.granted:
          isGpsPermissionGranted = true;
          break;
      }
    });
  }

  Future<Position> _getCurrentPosition() async {
    return await Geolocator.getCurrentPosition();
  }

  Future<void> close() async {
    gpsServiceSubscripcion?.cancel();
  }
}
