import 'package:advance_image_picker/advance_image_picker.dart';
import 'package:equatable/equatable.dart';
import 'package:project_111/features/properties/domain/entities/address.dart';

class Property extends Equatable {
  final int propertyId;
  final Address address;
  final String space;
  final String baths;
  final String bedRooms;
  final String storeys;
  final String dateAdded;
  final String description;
  final String price;
  final List<ImageObject> image;
  final String category;

  const Property({
    required this.propertyId,
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

  @override
  List<Object?> get props => [
        propertyId,
        address,
        space,
        baths,
        bedRooms,
        storeys,
        dateAdded,
        description,
        price,
        image,
        category,
      ];
}
