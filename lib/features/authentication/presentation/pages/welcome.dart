import 'package:flutter/material.dart';
import 'package:project_111/features/authentication/presentation/pages/sign_in.dart';
import 'package:project_111/features/authentication/presentation/pages/signup_screen.dart';


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
                  const Text("This application helps you to choose your property",
                      style: TextStyle(color: Colors.black, fontSize: 15)),
                  const SizedBox(height: 30),
                  //Button Log In
                  buildGestureDetector(
                    context: context,
                    nameButton: "Log In",
                    colorText: Colors.white,
                    colorBackground: Colors.green,
                    fun: () => Navigator.pushReplacementNamed(context,SingIn.routeName),
                  ),
                  const SizedBox(height: 30),
                  //Button Sing Up
                  buildGestureDetector(
                    context: context,
                    nameButton: "Sign Up",
                    colorText: Colors.green,
                    colorBackground: Colors.white,
                    fun: () =>Navigator.pushReplacementNamed(context,SignUpScreen.routeName ),
                  ),
                ],
              ),
            ),
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
