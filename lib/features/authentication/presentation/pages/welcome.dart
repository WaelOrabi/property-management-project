import 'package:flutter/material.dart';
import 'sign_in.dart';
import 'signup_screen.dart';
import '../widgets/signin_signup/button_signin_signup_update.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);
  static String routeName = 'Welcome';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SizedBox(
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
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 30),
                  ButtonSigninSignupProfile(
                    context: context,
                    text: "Log In",
                    fun: () => Navigator.pushReplacementNamed(
                        context, SingIn.routeName),
                  ),
                  const SizedBox(height: 30),
                  ButtonSigninSignupProfile(
                    backGroundColor: Colors.white,
                    colorText: Colors.green,
                    context: context,
                    text: "Sign Up",
                    fun: () => Navigator.pushReplacementNamed(
                        context, SignUpScreen.routeName),
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
