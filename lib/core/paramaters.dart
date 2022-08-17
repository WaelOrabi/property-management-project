import 'dart:io';

import '../features/properties/domain/entities/address.dart';
import '../features/properties/domain/entities/property.dart';

class NotificationParametersMessage {
  final String firstName;
  final String lastName;
  final File? image;
  final int idProperty;
  final String? message;

  NotificationParametersMessage(
      {required this.firstName,
      required this.lastName,
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

