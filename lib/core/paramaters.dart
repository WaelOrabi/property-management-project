import 'dart:io';
import 'package:advance_image_picker/models/image_object.dart';

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
  final String? message;

  NotificationParametersMessage(
      {required this.firstName,
      required this.lastName,
      required this.image,
      required this.idProperty,
      this.message});
}

class Address {
  final double latitude;
  final double longitude;
  final String region;
  final String city;
  final String country;

  Address({
    required this.latitude,
    required this.longitude,
    required this.region,
    required this.city,
    required this.country,
  });
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

class User {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? phoneNumber;
  String? password;
  File? image;
  List<Property>? listProperty;
  List<Property>? listPropertyFavorite;

  Address? address;
  bool? isAdmin;
  bool? isSuperAdmin;
  List<String>? messages;
  String? sendTime;

  User({
    this.sendTime,
    this.messages,
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNumber,
    this.password,
    this.image,
    this.listProperty,
    this.listPropertyFavorite,
    this.address,
    this.isAdmin,
    this.isSuperAdmin,
  });
}
