import 'package:geocoding/geocoding.dart';
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

  static Future<Map<String, dynamic>> getLocationAddress(double latitude, double longitude) async {
     Map<String,dynamic>locationAddress={};
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
    String? isoCountryCode = placeMark.isoCountryCode;
    locationAddress={
      "name":name,
      "subLocality":subLocality,
      "locality":locality,
      "administrativeArea":administrativeArea,
      "subAdministrativeArea":subAdministrativeArea,
      "postalCode":postalCode,
      "country":country,
      "subThoroughfare":subThoroughfare,
      "thoroughfare":thoroughfare,
      "isoCountryCode":isoCountryCode,
    };
    return locationAddress;
  }

}
