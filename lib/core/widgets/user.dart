import 'dart:io';
import 'package:project_111/core/widgets/address.dart';
import 'package:project_111/core/widgets/property.dart';

class User {
  int? id;
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;
  String? password;
  File? image;
  List<Property>? listProperty;
  Address? address;

  User(
      {this.id,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.phoneNumber,
      this.password,
      this.image,
      this.listProperty,
      this.address});
}
