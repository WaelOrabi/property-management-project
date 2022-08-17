import 'package:equatable/equatable.dart';

class Address extends Equatable {
  final double latitude;
  final double longitude;
  final String region;
  final String city;
  final String country;

  const Address({
    required this.latitude,
    required this.longitude,
    required this.region,
    required this.city,
    required this.country,
  });
  @override
  List<Object?> get props => [
        latitude,
        longitude,
        region,
        city,
        country,
      ];
}
