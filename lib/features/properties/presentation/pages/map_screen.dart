import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:project_111/core/widgets/location_helper.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);
  static String routeName = 'MapScreen';
  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  static Position? position;
   Marker? destination;
   double? lat;
   double?long;

  Completer <GoogleMapController> mapController = Completer();
FloatingSearchBarController floatingSearchBarController=FloatingSearchBarController();


  Future<void> getMyCurrentLocation()async{
    await LocationHelper.determineCurrentLocation();
    position=await Geolocator.getLastKnownPosition().whenComplete(() {setState(() {
    });});
  }

  Future<String> _getLocationAddress(double latitude, double longitude) async {
    List<Placemark> newPlace = await placemarkFromCoordinates(latitude, longitude);
    Placemark placeMark = newPlace[0];
    String? name = placeMark.name;
    String? subLocality = placeMark.subLocality;
    String? locality = placeMark.locality;
    String? administrativeArea = placeMark.administrativeArea;
    String?  subAdministrativeArea = placeMark.administrativeArea;
    String? postalCode = placeMark.postalCode;
    String? country = placeMark.country;
    String? subThoroughfare = placeMark.subThoroughfare;
    String? thoroughfare = placeMark.thoroughfare;
    String? _isoCountryCode = placeMark.isoCountryCode;
    return "name : $name,subThoroughfare: $subThoroughfare,subAdministrativeArea:$subAdministrativeArea,subLocality:$subLocality,_isoCountryCode:$_isoCountryCode ,thoroughfare:$thoroughfare,locality: $locality,administrativeArea: $administrativeArea,postalCode: $postalCode, country:$country";
  }

  static final CameraPosition myCurrentLocationCameraPosition = CameraPosition(
    bearing: 0.0,
    tilt: 0.0,
    target: LatLng(position!.latitude,position!.longitude),
    zoom: 17,
  );

  Widget buildMap(){
    return GoogleMap(
      mapType: MapType.normal,
      myLocationButtonEnabled: true,
      zoomControlsEnabled: false,
      myLocationEnabled: true,
      initialCameraPosition: myCurrentLocationCameraPosition,
      onMapCreated: (GoogleMapController controller){
        mapController.complete(controller);
      },
markers: {
  Marker(
    markerId: const MarkerId("origin"),
    infoWindow: const InfoWindow(title: "Origin"),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    position: LatLng(position!.latitude,position!.longitude),
  ),
  if(destination != null) destination!
},
     // onLongPress: _addMarker,
      onTap: (LatLng latLng) {
         lat = latLng.latitude;
        long = latLng.longitude;
         setState(() {
           destination=Marker(
             markerId: const MarkerId("destination"),
             infoWindow: const InfoWindow(title: "Destination"),
             icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
             position: LatLng(lat!,long!),
           );
         });
      },
    );
}

Future<void> goToMyCurrentLocation()async{
    final GoogleMapController controller =await mapController.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(myCurrentLocationCameraPosition));
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
        body:Stack(
          fit: StackFit.expand,
          children: [
            position != null ?
                buildMap():Center(
              child: Container(child: const CircularProgressIndicator(
                color: Colors.green,
              ),),
            ),
          ],
        ) ,
      floatingActionButton: Align(
        alignment: Alignment.bottomCenter,
        child: FloatingActionButton(
          child:const Text("Save",style: TextStyle(color: Colors.white),),
          onPressed: ()async{
            print("====================");
            print("My position latitude :${position!.latitude} and  position longitude: ${position!.longitude}");
          print( "${ await _getLocationAddress(position!.latitude, position!.longitude)}");
            Navigator.of(context).pop();
          },
        ),
      ),
      ),

    );
  }

}
