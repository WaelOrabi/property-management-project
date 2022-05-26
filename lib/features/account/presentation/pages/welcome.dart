import 'package:flutter/material.dart';

import '../../../../core/utils/utils.dart';
import '../../../account/presentation/pages/sign_in.dart';





class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.location_on,
                color: color,
                size: 150,
              ),
              const SizedBox(height: 30),
              Text(
                "Welcome to your app",
                style: TextStyle(color: color, fontSize: 25),
              ),
              const SizedBox(height: 30),
              const Text("This application helps you to choose your property",
                  style: TextStyle(color: Colors.black, fontSize: 15)),
              const SizedBox(height: 30),
              //Button Log In
              buildGestureDetector(
                context: context,
                nameButton: "Log In",
                colorText: Colors.white,
                colorBackground: color,
                fun: () =>
                    Navigator.pushNamed(context, SignInScreen.routeName),
              ),
              const SizedBox(height: 30),
              //Button Sing Up
              buildGestureDetector(
                context: context,
                nameButton: "Sign Up",
                colorText: color,
                colorBackground: Colors.white,
                fun: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector buildGestureDetector(
      {required BuildContext context,
      required String nameButton,
      required Color colorText,
      required Color colorBackground,
      required VoidCallback fun}) {
    return GestureDetector(
        child: Container(
          height: 40,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(50),
              color: colorBackground),
          child: Center(
            child: Text(
              nameButton,
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, color: colorText),
            ),
          ),
        ),
        onTap: fun);
  }
}
