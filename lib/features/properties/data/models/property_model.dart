import 'package:project_111/features/properties/domain/entities/address.dart';
import 'package:advance_image_picker/models/image_object.dart';
import 'package:project_111/features/properties/domain/entities/property.dart';

class PropertyModel extends Property {
  const PropertyModel({
    required int propertyId,
    required Address address,
    required String space,
    required String baths,
    required String bedRooms,
    required String storeys,
    required String dateAdded,
    required String description,
    required String price,
    required List<ImageObject> image,
    required String category,
  }) : super(
          propertyId:propertyId,
          address: address,
          space: space,
          baths: baths,
          bedRooms: bedRooms,
          storeys: storeys,
          dateAdded: dateAdded,
          description: description,
          price: price,
          image: image,
          category: category,
        );

  factory PropertyModel.fromJson(Map<String, dynamic> json) {
    return PropertyModel(
      propertyId: json['propertyId'],
      address: json['address'],
      space: json['space'],
      baths: json['baths'],
      bedRooms: json['bedRooms'],
      storeys: json['storeys'],
      dateAdded: json['dateAdded'],
      description: json['description'],
      price: json['price'],
      image: json['image'],
      category: json['category'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
'propertyId':propertyId,
'address':address,
'space':space,
'baths':baths,
'bedRooms':bedRooms,
'storeys':storeys,
'dateAdded':dateAdded,
'description':description,
'price':price,
'image':image,
'category':category
    };
  }
}
