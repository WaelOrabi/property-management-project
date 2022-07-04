import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:project_111/core/widgets/property.dart';
import 'package:project_111/features/properties/presentation/pages/property_listing_details.dart';

class AllPropertiesInMap extends StatefulWidget {
  AllPropertiesInMap({Key? key, required this.listProperty}) : super(key: key);

  List<Property> listProperty;

  @override
  State<AllPropertiesInMap> createState() => _AllPropertiesInMapState();
}

class _AllPropertiesInMapState extends State<AllPropertiesInMap> {
  Completer<GoogleMapController> mapController = Completer();
  List<Marker> _markers = [];
  List<Marker> list = [];

  @override
  void initState() {
    for (int i = 0; i < widget.listProperty.length; i++) {
      list.addAll(
        [
          Marker(
              markerId: MarkerId('${widget.listProperty[i].idProperty}'),
              position: LatLng(
                widget.listProperty[i].address!.latitude,
                widget.listProperty[i].address!.longitude,
              ),
              infoWindow:
                  InfoWindow(title: ''),
              icon: BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueRed),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PropertyListingDetails(
                              property: widget.listProperty[i],
                            )));
              }),
        ],
      );
    }
    _markers.addAll(list);
    // TODO: implement initState
    super.initState();
  }

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
        target: LatLng(widget.listProperty[0].address!.latitude,
            widget.listProperty[0].address!.longitude),
        zoom: 12,
      ),
      onMapCreated: (GoogleMapController controller) {
        mapController.complete(controller);
      },
      markers: Set.of(_markers),
    );
  }
}
