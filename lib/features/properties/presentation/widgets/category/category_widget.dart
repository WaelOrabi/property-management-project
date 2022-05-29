import 'package:flutter/material.dart';

GestureDetector buildGestureDetector({
  required BuildContext context,
  required String linkImage,
  required String nameBtn,
  required double height,
  required double width,
  required VoidCallback fun,

}) {
  return GestureDetector(
    child: Container(
      height:MediaQuery.of(context).size.height/height,
      width:MediaQuery.of(context).size.width/width,
      decoration:BoxDecoration(
          image: DecorationImage(image: AssetImage(linkImage),
            fit: BoxFit.cover,colorFilter:const ColorFilter.mode(Colors.grey,
                BlendMode.modulate),
          ),
          borderRadius: BorderRadius.circular(10)
      ),
      child: Center(child: Text(nameBtn,style:const TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),)),
    ),
    onTap: fun,
  );
}

