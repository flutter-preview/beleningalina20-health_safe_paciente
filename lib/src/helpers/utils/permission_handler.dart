import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionHandler extends ChangeNotifier {
  bool _isGpsEnabled = false;
  bool _isLocationPermissionGranted = false;
  bool _isNotificacionPermissionGranted = false;

  Position? currentPosition;

  bool get isGpsEnabled => _isGpsEnabled;
  set isGpsEnabled(bool value) {
    _isGpsEnabled = value;
    notifyListeners();
  }

  bool get isLocationPermissionGranted => _isLocationPermissionGranted;
  set isLocationPermissionGranted(bool value) {
    _isLocationPermissionGranted = value;
    notifyListeners();
  }

  bool get isNotificacionPermissionGranted => _isNotificacionPermissionGranted;
  set isNotificacionPermissionGranted(bool value) {
    _isNotificacionPermissionGranted = value;
    notifyListeners();
  }

  StreamSubscription? gpsServiceSubscripcion;

  PermissionHandler() {
    _init();
  }

  Future<void> _init() async {
    isGpsEnabled = await _checkGpsStatus();
    isLocationPermissionGranted =
        await _isPermissionGranted(Permission.location);
    isNotificacionPermissionGranted =
        await _isPermissionGranted(Permission.notification);

    if (!isLocationPermissionGranted) {
      _askPermissionAccess(Permission.location,
          (bool value) => isLocationPermissionGranted = value);
    } else {
      if (isGpsEnabled) {
        currentPosition = await Geolocator.getCurrentPosition();
      }
    }

    if (!isNotificacionPermissionGranted) {
      _askPermissionAccess(Permission.notification,
          (bool value) => isNotificacionPermissionGranted = value);
    } else {}
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

  Future<bool> _isPermissionGranted(Permission permission) async {
    return await permission.isGranted.then((value) => value);
  }

  void _askPermissionAccess(
      Permission permission, void Function(bool) updateStatePermission) async {
    await permission.request().then((value) {
      switch (value) {
        case PermissionStatus.denied:
        case PermissionStatus.limited:
        case PermissionStatus.permanentlyDenied:
        case PermissionStatus.restricted:
          updateStatePermission(false);
          openAppSettings();
          break;

        case PermissionStatus.granted:
          updateStatePermission(true);
          break;
      }
    });
  }

  void askGpsAccess() async {
    _askPermissionAccess(Permission.location,
        (bool value) => isLocationPermissionGranted = value);
  }

  Future<void> close() async {
    gpsServiceSubscripcion?.cancel();
  }
}
