import 'package:flutter/material.dart';
import 'package:project_111/features/authentication/presentation/pages/signup_screen/components/body.dart';

class SignUpScreen extends StatelessWidget {
  static String routeName = 'SignUpScreen';

  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
    );
  }
}
