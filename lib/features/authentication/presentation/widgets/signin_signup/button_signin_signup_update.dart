
import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
GestureDetector ButtonSigninSignupProfile({
  required BuildContext context,
  required double height,
  double width=1,
  required double circle,
  required String text,
  required double fontSize,
  required FontWeight fontWeight,
  required Color colorText,
  required Color backGroundColor,
  required VoidCallback fun,
  isBorder=null,
}) {
  return GestureDetector(
    child: Container(
      height: height,
      width: MediaQuery.of(context).size.width/width,
      decoration: BoxDecoration(
         border:isBorder!=null? Border.all():null,
          borderRadius: BorderRadius.circular(circle),
          color: backGroundColor),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
              fontSize: fontSize, fontWeight: fontWeight, color: colorText),
        ),
      ),
    ),
    onTap: fun ,
  );
}