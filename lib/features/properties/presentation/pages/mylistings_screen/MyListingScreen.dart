import 'package:flutter/material.dart';

import '../../../../authentication/presentation/pages/signup_screen/body.dart';

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
