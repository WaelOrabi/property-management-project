import 'package:flutter/material.dart';
import '../../../../core/widgets/bottom_navigation_bar.dart';
import 'signup_screen.dart';
import 'welcome.dart';
import '../widgets/signin_signup/button_signin_signup_update.dart';
import '../widgets/signin_signup/return_button.dart';
import '../widgets/signin_signup/textformfield_signin_signup_updateProfile.dart';

class SingIn extends StatefulWidget {
  const SingIn({Key? key}) : super(key: key);
  static String routeName = 'SignIn';

  @override
  State<SingIn> createState() => _SingInState();
}

class _SingInState extends State<SingIn> {
  bool obscureTextPassword=true;
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
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
                buildReturnButton(
                    fun: () => Navigator.pushReplacementNamed(
                        context, Welcome.routeName),
                    icon: const Icon(Icons.arrow_back_ios)),

                const SizedBox(height: 20),
                Text(
                  "Sign In",
                  style: TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                const SizedBox(height: 80),

                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      ////Enter Email address
                      TextForm(
                          suffixIcon: false,
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
                          suffixIcon: true,
                          icon: Icons.lock,
                          fun: (){
                            setState(() {
                              obscureTextPassword=!obscureTextPassword;
                            });
                          },
                          obscureText: obscureTextPassword,
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
                  text: 'Log In',
                  fun: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.pushReplacementNamed(
                          context, NavigationBarHome.routeName);
                    }
                  },
                ),
                const SizedBox(height: 15),

                //if you don't have account
                Container(
                  margin: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text.rich(TextSpan(children: [
                        TextSpan(
                            text: "Don't have any account? ",
                            style: Theme.of(context).textTheme.bodyText1),
                      ])),
                      GestureDetector(
                        onTap: () => Navigator.pushReplacementNamed(
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

                SizedBox(height: MediaQuery.of(context).size.height/20,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
