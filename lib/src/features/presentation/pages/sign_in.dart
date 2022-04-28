import 'package:flutter/material.dart';
import 'package:project_111/src/core/utils/utils.dart';
import 'package:project_111/src/features/presentation/pages/profile.dart';
import 'package:project_111/src/features/presentation/pages/welcome.dart';

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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  //Icon back to screen welcome
                  IconButton(
                      onPressed: () => Navigator.pushReplacementNamed(context, Welcome.routeName),
                      icon: const Icon(Icons.arrow_back_ios)),

                  const SizedBox(height: 20),
                  Text(
                    "Sign In",
                    style: TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                      color: color,
                    ),
                  ),
                  const SizedBox(height: 80),

                  Form(
                    key: _formKey,
                    child: Column(
                      children: [

                        ////Enter Email address
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: emailController,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.email),
                            label: const Text(
                              "Email",
                              style: TextStyle(fontSize: 20),
                            ),
                            hintText: "Enter your email",
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: const BorderSide(color: Colors.grey),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                          validator: (value) {
                            bool emailValid = RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value!);
                            if (emailValid) {
                              return "Enter a valid email please";
                            }
                            return null;
                          },
                        ),

                        const SizedBox(height: 20),

                        ////Enter the password
                        TextFormField(
                          obscureText: true,
                          keyboardType: TextInputType.visiblePassword,
                          controller: passwordController,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.lock),
                            suffixIcon: IconButton(
                              icon: const Icon(Icons.visibility),
                              onPressed: () {},
                            ),
                            label: const Text(
                              "Password",
                              style: TextStyle(fontSize: 20),
                            ),
                            hintText: "Enter your Password",
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: const BorderSide(color: Colors.grey),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                          validator: (value) {
                            bool passValid = RegExp(
                                    "^(?=.{8,32}\$)(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!@#\$%^&*(),.?:{}|<>]).*")
                                .hasMatch(value!);

                            if (value.isEmpty) {
                              return "Enter your password please";
                            } else if (value.length < 6) {
                              return "The password leas from 6 liters";
                            }
                            if (!passValid) {
                              return "Enter valid";
                            } else {
                              return null;
                            }
                          },
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),

                  //button of Log in
                  GestureDetector(
                      child: Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: color),
                        child: const Center(
                          child: Text(
                            'Log In',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      onTap: () {

                          Navigator.pushReplacementNamed(context,Profile.routeName);

                      }),

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
                              TextSpan(text: "Don\'t have any account? "),
                            ])),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            "Create",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 19,
                                color: color),
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
                          linkImage: "assets/images/google-logo.png",
                          fun: () {}),
                      const SizedBox(width: 30.0),
                      //facebook
                      buildIconFacebookAndGoogle(
                          height: 55,
                          width: 55,
                          linkImage: "assets/images/logo-facebook.png",
                          fun: () {}),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }


//Icons of facebook and google under the button
  GestureDetector buildIconFacebookAndGoogle(
      {required double height,
      required double width,
      required String linkImage,
      required Function fun}) {
    return GestureDetector(
      child: Container(
        height: height,
        width: width,
        padding: const EdgeInsets.all(0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
        ),
        child: Image.asset(linkImage),
      ),
      onTap: () => fun,
    );
  }
}
