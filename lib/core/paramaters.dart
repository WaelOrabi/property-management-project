import 'dart:io';

import 'package:advance_image_picker/models/image_object.dart';
import 'package:project_111/core/widgets/address.dart';

class Property {
  final int? idProperty;
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

  Property({
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

class NotificationParametersMessage {
  final String firstName;
  final String lastName;
  final File image;
  final int idProperty;
  final String ? message;

  NotificationParametersMessage(
      {required this.firstName,required this.lastName,
      required this.image,
      required this.idProperty,
       this.message});
}



class SearchParameters {
  final String typeProperty;
  final String typeGovernorate;
  final List<double> price;
  final String room;
  final String storey;
  final List<double> space;

  SearchParameters(
      {required this.typeProperty,
      required this.typeGovernorate,
      required this.price,
      required this.room,
      required this.storey,
      required this.space});
}
