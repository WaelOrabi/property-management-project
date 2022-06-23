import 'package:flutter/material.dart';

SizedBox buildSizedBox({required context,height = 0.0, width = 0.0}) {
  return SizedBox(
    height:height!=0.0? MediaQuery.of(context).size.height/height:0.0,
    width:width!=0.0?MediaQuery.of(context).size.width/width:0.0,
  );
}