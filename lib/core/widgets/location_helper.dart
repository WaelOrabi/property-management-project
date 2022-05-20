import 'package:geolocator/geolocator.dart';

class LocationHelper{

  static Future<Position> determineCurrentLocation()async{
    bool isServiceEnable =await Geolocator.isLocationServiceEnabled();
    if(!isServiceEnable)
    {
      await Geolocator.requestPermission();
    }

  return await Geolocator.getCurrentPosition
    (
    desiredAccuracy: LocationAccuracy.high
  );
}
}
