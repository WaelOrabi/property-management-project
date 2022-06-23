import 'package:flutter/material.dart';
import 'package:project_111/features/authentication/presentation/pages/profile.dart';
import 'package:project_111/features/authentication/presentation/pages/signup_screen.dart';
import 'package:project_111/features/authentication/presentation/pages/welcome.dart';

import '../widgets/signin_signup/button_signin_signup_update.dart';
import '../widgets/signin_signup/iconbutton_for_signin_and_signup_with_other_apps.dart';
import '../widgets/signin_signup/return_button.dart';
import '../widgets/signin_signup/textformfield_signin_signup_updateProfile.dart';

class SingIn extends StatefulWidget {
  const SingIn({Key? key}) : super(key: key);
  static String routeName = 'SignIn';
  @override
  State<SingIn> createState() => _SingInState();
}

class _SingInState extends State<SingIn> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(context),
    );
  }

  SafeArea buildBody(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                //Icon back to screen welcome
                buildReturnButton(fun: () => Navigator.pushReplacementNamed(
                    context, Welcome.routeName),icon: const Icon(Icons.arrow_back_ios)),

                const SizedBox(height: 20),
                const Text(
                  "Sign In",
                  style: TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                const SizedBox(height: 80),

                Form(
                  key: _formKey,
                  child: Column(
                    children: [

                      ////Enter Email address
                      TextForm(
                          prefixIcon: false,
                          icon: Icons.email,
                          validator: (value) {
                            bool emailValid = RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value!);
                            if (!emailValid) {
                              return "Please re-enter your email";
                            }
                            if (value.isEmpty) {
                              return "Please enter your email";
                            }
                            return null;
                          },
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          labelText: "Enter Email",
                          hintText: "enter email"),

                      const SizedBox(height: 20),

                      ////Enter the password
                      TextForm(
                          prefixIcon: true,
                          icon: Icons.lock,
                          validator: (value) {
                            if (value!.isEmpty) return 'Please enter password';
                            if (!isPasswordCompliant(passwordController.text)) {
                              return 'Please re-enter password';
                            }
                            return null;
                          },
                          controller: passwordController,
                          keyboardType: TextInputType.text,
                          labelText: "Password",
                          hintText: 'Enter your password'),
                    ],
                  ),
                ),

                const SizedBox(height: 30),
                ButtonSigninSignupProfile(
                    context: context,
                    height: 40,
                    circle: 50,
                    text: 'Log In',
                    fun: () {
                      Navigator.pushReplacementNamed(
                          context, Profile.routeName);
                    },
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    colorText: Colors.white,
                    backGroundColor: Colors.green),
                const SizedBox(height: 15),

                //if you don't have account
                Container(
                  margin: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: const [
                          Text.rich(TextSpan(children: [
                            TextSpan(text: "Don't have any account? "),
                          ])),
                        ],
                      ),
                      GestureDetector(
                        onTap: () =>
                            Navigator.pushReplacementNamed(
                                context, SignUpScreen.routeName),
                        child: const Text(
                          "Create",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 19,
                              color: Colors.green),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30.0),
                const Center(
                  child: Text("Or sign in using ..",
                      style: TextStyle(color: Colors.grey)),
                ),
                const SizedBox(height: 25.0),

                //Icons of facebook and google under the button
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //google
                    buildIconFacebookAndGoogle(
                        height: 40,
                        width: 40,
                        linkImage: "assets/images/google.jpg",
                        fun: () {}),
                    const SizedBox(width: 30.0),
                    //facebook
                    buildIconFacebookAndGoogle(
                        height: 55,
                        width: 55,
                        linkImage: "assets/images/facebook.jpg",
                        fun: () {}),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
