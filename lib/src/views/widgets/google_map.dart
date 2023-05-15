import 'dart:async';
import 'package:flutter/material.dart';
import 'package:health_safe_paciente/src/helpers/extra/widget_to_markers.dart';
import 'package:health_safe_paciente/src/helpers/utils/permission_handler.dart';
import 'package:health_safe_paciente/src/views/widgets/alert_dialog.dart';
import 'package:health_safe_paciente/src/views/widgets/text.dart';
import 'package:provider/provider.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:health_safe_paciente/src/theme/themes.dart';

class GoogleMapCustom extends StatelessWidget {
  final double? height;
  final LatLng coordenadasDestino;
  final String destino;
  const GoogleMapCustom({
    super.key,
    this.height,
    required this.coordenadasDestino,
    required this.destino,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MapProvider()),
      ],
      child: SizedBox(
        width: double.infinity,
        height: height ?? Dimens.dimens300,
        child: _GoogleMap(
            coordenadasDestino: coordenadasDestino, destino: destino),
      ),
    );
  }
}

class _GoogleMap extends StatelessWidget {
  final LatLng coordenadasDestino;
  final String destino;
  const _GoogleMap(
      {Key? key, required this.coordenadasDestino, required this.destino})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    LatLng? coordenadasActual;

    final mapProvider = Provider.of<MapProvider>(context);
    final permissionHandler = Provider.of<PermissionHandler>(context);

    if (permissionHandler.isGpsEnabled &&
        permissionHandler.isLocationPermissionGranted) {
      Position? currentPosition = permissionHandler.currentPosition;
      if (currentPosition != null) {
        coordenadasActual =
            LatLng(currentPosition.latitude, currentPosition.longitude);
      }
    }

    return WillPopScope(
      onWillPop: () async {
        await permissionHandler.close();
        return true;
      },
      child: Stack(
        children: [
          FutureBuilder(
              future: getMapMarkers(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<BitmapDescriptor>> snapshot) {
                BitmapDescriptor? startMarker;
                BitmapDescriptor? endMarker;

                if (snapshot.hasData) {
                  var markers = snapshot.data;

                  if (markers != null && markers.isNotEmpty) {
                    startMarker = markers.first;
                    endMarker = markers[1];
                  }
                }

                return GoogleMap(
                  mapType: MapType.normal,
                  zoomControlsEnabled: false,
                  compassEnabled: false,
                  mapToolbarEnabled: false,
                  markers: {
                    if (coordenadasActual != null)
                      Marker(
                          markerId: const MarkerId("ubicacion-inicial"),
                          icon: startMarker ?? BitmapDescriptor.defaultMarker,
                          anchor: const Offset(0, 1),
                          position: coordenadasActual),
                    Marker(
                        markerId: const MarkerId("ubicacion-destino"),
                        anchor: const Offset(0.9, 0.7),
                        icon: endMarker ?? BitmapDescriptor.defaultMarker,
                        position: coordenadasDestino),
                  },
                  initialCameraPosition: CameraPosition(
                    target: coordenadasDestino,
                    zoom: 15,
                  ),
                  onMapCreated: (GoogleMapController controller) {
                    mapProvider.onMapCreated(controller);
                  },
                );
              }),
          Container(
            alignment: Alignment.topRight,
            margin: EdgeInsets.all(Dimens.dimens10),
            child: CircleAvatar(
              backgroundColor: ColorsApp.azulBusqueda,
              radius: 20,
              child: IconButton(
                  icon: const Icon(Icons.info, color: Colors.white),
                  onPressed: () => showDialogCustom(
                        context,
                        [
                          const DescriptionText(
                              text:
                                  "Si queres tambien ver tu ubicacion actual en el mapa, activa tu GPS desde tu dispositivo y acepta los permisos para acceder a tu ubicacion"),
                          StatefulBuilder(
                            builder: (context, setState) => Column(
                              children: [
                                SwitchListTile(
                                    title: const SubdescriptionText(
                                        text: "Activar GPS",
                                        fontWeight: FontWeight.bold),
                                    value: permissionHandler.isGpsEnabled,
                                    onChanged: (bool value) {}),
                                SwitchListTile(
                                    title: const SubdescriptionText(
                                        text: "Aceptar permisos",
                                        fontWeight: FontWeight.bold),
                                    value: permissionHandler
                                        .isLocationPermissionGranted,
                                    onChanged: (bool value) async {
                                      if (!permissionHandler
                                              .isLocationPermissionGranted &&
                                          value) {
                                        permissionHandler.askGpsAccess();
                                        Navigator.pop(context);
                                      }
                                    }),
                              ],
                            ),
                          ),
                        ],
                        barrierDismissible: false,
                        onAccept: () => Navigator.pop(context),
                      )),
            ),
          ),
          Container(
            alignment: Alignment.bottomRight,
            margin: EdgeInsets.all(Dimens.dimens10),
            child: CircleAvatar(
              backgroundColor: ColorsApp.azulBusqueda,
              radius: 20,
              child: IconButton(
                  icon: const Icon(Icons.my_location_outlined,
                      color: Colors.white),
                  onPressed: () => mapProvider.moveCamera(coordenadasDestino)),
            ),
          )
        ],
      ),
    );
  }
}

class MapProvider extends ChangeNotifier {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  void onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
    notifyListeners();
  }

  void moveCamera(LatLng target) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: target, zoom: 15)));
  }
}
