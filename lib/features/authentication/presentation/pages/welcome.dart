import 'package:flutter/material.dart';
import 'package:project_111/features/authentication/presentation/pages/sign_in.dart';
import 'package:project_111/features/authentication/presentation/pages/signup_screen.dart';
import 'package:project_111/features/authentication/presentation/widgets/signin_signup/button_signin_signup_update.dart';

import '../../../properties/presentation/widgets/category/category_widget.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);
  static String routeName = 'Welcome';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
             Icons.location_on,
                    color: Colors.green,
                    size: 150,
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    "Welcome to your app",
                    style: TextStyle(color: Colors.green, fontSize: 25),
                  ),
                  const SizedBox(height: 30),
                 const Text(
                      "This application helps you to choose your property",
                      style: TextStyle(color: Colors.black, fontSize: 15)),
                  const SizedBox(height: 30),
                  ButtonSigninSignupProfile(
                      context: context,
                      height: 40,
                      circle: 50,
                      text: "Log In",
                      fontWeight: FontWeight.bold,
                      colorText: Colors.white,
                      backGroundColor: Colors.green,
                      fun: () => Navigator.pushReplacementNamed(
                          context, SingIn.routeName),
                  isBorder: Border.all(),
                  ),
                  const SizedBox(height: 30),
                  ButtonSigninSignupProfile(
                      context: context,
                      height: 40,
                      circle: 50,
                      text: "Sign Up",
                      fontWeight: FontWeight.bold,
                      colorText: Colors.green,
                      backGroundColor: Colors.white,
                      fun: () => Navigator.pushReplacementNamed(
                          context, SignUpScreen.routeName),
                      isBorder:Border.all()
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
