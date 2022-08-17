import 'dart:io';
import 'package:equatable/equatable.dart';

import '../../../properties/domain/entities/address.dart';
import '../../../properties/domain/entities/property.dart';

class User extends Equatable {
  int userId;
  String firstName;
  String lastName;
  String email;
  String phoneNumber;
  String? password;
  File? image;
  List<Property>? listProperty;
  List<Property>? listPropertyFavorite;
  Address? address;
  bool? isAdmin;
  bool? isSuperAdmin;
  List<String>? messages;
  List<String>? sendTime;
  List<bool>? isMe;

  User({
    this.sendTime,
    this.messages,
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    this.password,
    this.image,
    this.listProperty,
    this.listPropertyFavorite,
    this.address,
    this.isAdmin,
    this.isSuperAdmin,
    this.isMe,
  });

  @override
  List<Object?> get props => [];
}
