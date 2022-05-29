import 'package:flutter/material.dart';

//Icons of facebook and google under the button
GestureDetector buildIconFacebookAndGoogle(
    {required double height,
      required double width,
      required String linkImage,
      required VoidCallback fun}) {
  return GestureDetector(
    child: Container(
      height: height,
      width: width,
      padding: const EdgeInsets.all(0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
      ),
      child: Image.asset(linkImage),
    ),
    onTap: fun,
  );
}
