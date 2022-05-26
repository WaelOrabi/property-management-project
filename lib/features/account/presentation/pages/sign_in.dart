import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:property_management_frontend/features/account/presentation/pages/profile.dart';
import 'package:property_management_frontend/features/account/presentation/pages/welcome.dart';

import '../../../../core/utils/utils.dart';
import '../blocs/sign_in_bloc/export_bloc.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);
  static String routeName = 'SignInScreen';
  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<SignInBloc, SignInState>(
          listener: (context, state) {
            if (state is SignInFailedState) {
              WidgetsBinding.instance?.addPostFrameCallback(
                  (_) => _showMyDialog(context, 'Alert', (state).error));
            } else {
              Navigator.of(context).pushReplacementNamed(Profile.routeName);
            }
          },
          builder: (context, state) {
            if (state is SignInPendingState) {
              // TODO disable all buttons
              return signInMainLayout(context);
            }
            return signInMainLayout(context);
          },
          buildWhen: (previousState, currentState) {
            return currentState is SignInPendingState ||
                currentState is SignInNormalState;
          },
          listenWhen: (previousState, currentState) {
            return currentState is SignInSuccessfulState ||
                currentState is SignInFailedState;
          },
        ),
      ),
    );
  }

  Widget signInMainLayout(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Icon back to screen welcome
            IconButton(
                onPressed: () => Navigator.pushReplacementNamed(
                    context, WelcomeScreen.routeName),
                icon: const Icon(Icons.arrow_back_ios)),

            const SizedBox(height: 20),
            const Text(
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
                    obscureText: _obscurePassword,
                    keyboardType: TextInputType.visiblePassword,
                    controller: passwordController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.visibility),
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
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
                        return "The password has least than 6 letters";
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

            //button of Sign in
            GestureDetector(
                child: Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50), color: color),
                  child: const Center(
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
                onTap: () {
                  BlocProvider.of<SignInBloc>(context).add(SignInSubmittedEvent(
                      emailController.text, passwordController.text));
                }),

            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }

  Future<void> _showMyDialog(
      BuildContext context, String title, String text) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: Text(
              text,
              softWrap: true,
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
                BlocProvider.of<SignInBloc>(context).add(SignInTypingEvent(
                    emailController.text, passwordController.text));
              },
            ),
          ],
        );
      },
    );
  }
}
