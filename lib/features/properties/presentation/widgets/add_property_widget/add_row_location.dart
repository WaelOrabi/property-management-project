import 'package:flutter/material.dart';
import 'package:project_111/core/widgets/address.dart';

import '../../pages/map_screen.dart';

Row rowAddLocation(BuildContext context,Address address) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      const Text(
        "Location",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      SizedBox(
          width: MediaQuery.of(context).size.width / 2.3,
          child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MapScreen(
                      address: address,
                    ),
                  ),
                ).then((val) {
                  address = val; //you get details from screen2 here
                });
              },
              child: const Text(
                "Add location",
                style: TextStyle(color: Colors.black, fontSize: 16),
              )))
    ],
  );
}