import 'package:flutter/material.dart';

class SignUp {
  String firstName, lastName, username, password;
  SignUp(this.firstName, this.lastName, this.username, this.password);
  bool validateInfo() {
    return firstName.isNotEmpty && lastName.isNotEmpty && username.isNotEmpty && password.isNotEmpty;
    
  }
}