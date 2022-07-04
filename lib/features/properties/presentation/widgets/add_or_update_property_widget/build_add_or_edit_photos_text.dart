import 'package:flutter/material.dart';

buildAddOrUpdatePhotosText({required bool isUpdate}) {
  return Padding(
    padding: const EdgeInsets.only(top: 8, bottom: 8),
    child: Text(
      isUpdate == true ? "Update Photos" : "Add Photos",
      style: const TextStyle(
          color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
    ),
  );
}