import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
TextFormField TextForm(
    {required FormFieldValidator<String>? validator,
      required TextEditingController controller,
      required TextInputType? keyboardType,
      required String labelText,
      required IconData icon,
      double fontSize=20,
      bool obscureText=false,
      FontWeight fontWeight=FontWeight.normal,
      double circle=50,
      Color colorText=Colors.black,
      Color colorLineBorder=Colors.grey,
      required bool prefixIcon,
      required String hintText}) {
  return TextFormField(
    cursorColor: Colors.green,
    obscureText: obscureText,
    controller: controller,
    onSaved: (newValue) {
      controller.text = newValue!;
    },
    validator: validator,
    keyboardType: keyboardType,
    style:  TextStyle(fontSize:fontSize,fontWeight: fontWeight, color: colorText),
    decoration: InputDecoration(
      contentPadding:
      const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      labelText: labelText,
      hintText: hintText,
      // ignore: unnecessary_null_comparison
      prefixIcon: Icon(
        icon,
      ),
      // ignore: unnecessary_null_comparison
      suffixIcon: prefixIcon == true
          ?  IconButton(onPressed: () { obscureText=!obscureText; }, icon:Icon(Icons.visibility))
          : null,
      enabledBorder:  OutlineInputBorder(
        borderSide: BorderSide(color: colorLineBorder),
        borderRadius: BorderRadius.circular(circle),
      ),
      focusedBorder:  OutlineInputBorder(
        borderSide: BorderSide(color:colorLineBorder),
        borderRadius: BorderRadius.circular(circle),
      ),
    ),
  );
}

bool isPasswordCompliant(String password, [int minLength = 6]) {
  if (password.isEmpty) {
    return false;
  }

  bool hasUppercase = password.contains(RegExp(r'[A-Z]'));
  bool hasDigits = password.contains(RegExp(r'[0-9]'));
  bool hasLowercase = password.contains(RegExp(r'[a-z]'));
  bool hasSpecialCharacters =
  password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
  bool hasMinLength = password.length > minLength;

  return (hasDigits ||
      hasUppercase ||
      hasLowercase ||
      hasSpecialCharacters) &&
      hasMinLength;
}