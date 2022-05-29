import 'package:flutter/material.dart';
import 'package:project_111/features/properties/presentation/pages/mylistings_screen/components/body.dart';

class MyListingScreen extends StatelessWidget {
  static String routeName='MyListingScreen';
  const MyListingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:Body(),
    );
  }
}
