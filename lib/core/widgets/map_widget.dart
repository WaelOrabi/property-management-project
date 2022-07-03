import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapWidget extends StatefulWidget {
  MapWidget(
      {Key? key, required this.latDestination, required this.longDestination})
      : super(key: key);
  final double latDestination;
  final double longDestination;

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  Completer<GoogleMapController> mapController = Completer();

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      mapType: MapType.normal,
      myLocationButtonEnabled: true,
      zoomControlsEnabled: true,
      myLocationEnabled: true,
      onCameraMove: (CameraPosition cameraPosition) {
        print(cameraPosition.zoom);
      },
      initialCameraPosition: CameraPosition(
        bearing: 0.0,
        tilt: 0.0,
        target: LatLng(widget.latDestination, widget.longDestination),
        zoom: 15,
      ),
      onMapCreated: (GoogleMapController controller) {
        mapController.complete(controller);
      },
      markers: {
        Marker(
          markerId: const MarkerId("Property"),
          infoWindow: const InfoWindow(title: "Property"),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
          position: LatLng(widget.latDestination, widget.longDestination),
        ),
      },
    );
  }
}
