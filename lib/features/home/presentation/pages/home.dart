import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = 'Home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('home page'),
    );
  }
}
