import 'package:flutter/material.dart';

widgetBtnAddOrUpdate({required bool isUpdate,required VoidCallback fun}) {
  return Builder(
    builder: (context) {
      return SizedBox(
        height: MediaQuery.of(context).size.height/11,
        child: GestureDetector(
            child: Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.green),
              child: Center(
                child: Text(
                  isUpdate == true ? "Update Property" : "Add Property",
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
            onTap: fun),
      );
    }
  );
}
