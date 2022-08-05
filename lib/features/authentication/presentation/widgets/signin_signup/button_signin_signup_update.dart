import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
GestureDetector ButtonSigninSignupProfile({
  required BuildContext context,
  double height=50,
  double width = 1,
  double circle=50,
  required String text,
  double fontSize = 20.0,
  FontWeight fontWeight=FontWeight.bold,
   Color colorText=Colors.white,
  Color backGroundColor=Colors.green,
  Color? borderColor,
  required VoidCallback fun,
}) {
  return GestureDetector(
    child: Container(
      height: height,
      width: MediaQuery.of(context).size.width / width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(circle),
          border:borderColor==null?Border.all() :Border.all(color: borderColor),
          color: Theme.of(context).primaryColor),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
              fontSize: fontSize,
              fontWeight: fontWeight,
              color: colorText),
        ),
      ),
    ),
    onTap: fun,
  );
}
