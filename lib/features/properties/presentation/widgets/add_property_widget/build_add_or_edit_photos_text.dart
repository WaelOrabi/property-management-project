import 'package:flutter/material.dart';

buildAddOrEditPhotosText(bool isEdit) {
  return Padding(
    padding: const EdgeInsets.only(top: 8, bottom: 8),
    child: Text(
      isEdit == true ? "Edit Photos" : "Add Photos",
      style: const TextStyle(
          color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
    ),
  );
}