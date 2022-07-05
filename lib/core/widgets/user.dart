import 'dart:io';
import 'package:project_111/core/paramaters.dart';
import 'package:project_111/core/widgets/address.dart';


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
  List<String>?messages;
  String ? sendTime;
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
