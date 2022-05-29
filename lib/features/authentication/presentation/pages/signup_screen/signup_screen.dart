import 'package:flutter/material.dart';
import 'package:project_111/features/authentication/presentation/pages/signup_screen/body.dart';

class SignUpScreen extends StatelessWidget {
  static String routeName = 'SignUpScreen';

  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body:const Body(),
    );
  }
}
