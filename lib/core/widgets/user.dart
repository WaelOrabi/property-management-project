import 'dart:io';
import 'package:project_111/core/widgets/address.dart';
import 'package:project_111/core/widgets/property.dart';

class User {
  int? id;
   String? firstName;
   String? lastName;
   String? email;
   String? phoneNumber;
  String? password;
  File? image;
  List<Property>? listProperty;
  Address? address;

  User(
      {this.id,
       this.firstName,
       this.lastName,
       this.email,
       this.phoneNumber,
      this.password,
      this.image,
      this.listProperty,
      this.address});
}
