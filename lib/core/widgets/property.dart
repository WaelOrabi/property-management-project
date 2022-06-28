import 'package:project_111/core/widgets/address.dart';

class Property {
  final int? idProperty;
  final Address? address;
  final String space;
  final String baths;
  final String bedRooms;
  final String storeys;
  final String dateAdded;
  final String description;
  final String price;
  final List image;
  final String category;

  Property( {
    this.idProperty,
    required this.address,
    required this.space,
    required this.baths,
    required this.bedRooms,
    required this.storeys,
    required this.dateAdded,
    required this.description,
    required this.price,
    required this.image,
    required this.category,
  });

}
