import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import '../../../../core/widgets/location_helper.dart';
import '../../domain/entities/address.dart';

// ignore: must_be_immutable
class MapScreen extends StatefulWidget {
  MapScreen({Key? key, this.address}) : super(key: key);
  static String routeName = 'MapScreen';
  Address? address;

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  static Position? position;
  Marker? destination;
  double? lat;
  double? long;

  Completer<GoogleMapController> mapController = Completer();
  FloatingSearchBarController floatingSearchBarController =
      FloatingSearchBarController();

  Future<void> getMyCurrentLocation() async {
    await LocationHelper.determineCurrentLocation();
    position = await Geolocator.getLastKnownPosition().whenComplete(() {
      setState(() {});
    });
  }

  static final CameraPosition myCurrentLocationCameraPosition = CameraPosition(
    bearing: 0.0,
    tilt: 0.0,
    target: LatLng(position!.latitude, position!.longitude),
    zoom: 17,
  );

  Widget buildMap() {
    return GoogleMap(
      mapType: MapType.normal,
      myLocationButtonEnabled: true,
      zoomControlsEnabled: false,
      myLocationEnabled: true,
      initialCameraPosition: myCurrentLocationCameraPosition,
      onMapCreated: (GoogleMapController controller) {
        mapController.complete(controller);
      },
      markers: {
        Marker(
          markerId: const MarkerId("origin"),
          infoWindow: const InfoWindow(title: "Origin"),
          icon:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
          position: LatLng(position!.latitude, position!.longitude),
        ),
        if (destination != null) destination!
      },
      // onLongPress: _addMarker,
      onTap: (LatLng latLng) {
        lat = latLng.latitude;
        long = latLng.longitude;
        setState(() {
          destination = Marker(
            markerId: const MarkerId("destination"),
            infoWindow: const InfoWindow(title: "Destination"),
            icon:
                BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
            position: LatLng(lat!, long!),
          );
        });
      },
    );
  }

  Future<void> goToMyCurrentLocation() async {
    final GoogleMapController controller = await mapController.future;
    controller.animateCamera(
        CameraUpdate.newCameraPosition(myCurrentLocationCameraPosition));
  }

  @override
  void initState() {
    super.initState();
    getMyCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            position != null
                ? buildMap()
                : const Center(
                    child: CircularProgressIndicator(
                      color: Colors.green,
                    ),
                  ),
          ],
        ),
        floatingActionButton: Align(
          alignment: Alignment.bottomCenter,
          child: FloatingActionButton(
            child: const Text(
              "Save",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () async {
              var mapLocationAddress =
                  (await LocationHelper.getLocationAddress(lat!, long!));
              widget.address = Address(
                  latitude: lat!,
                  longitude: long!,
                  region: mapLocationAddress["subLocality"],
                  city: mapLocationAddress["administrativeArea"],
                  country: mapLocationAddress["country"]);
              Navigator.pop(context, widget.address);
            },
          ),
        ),
      ),
    );
  }
}
