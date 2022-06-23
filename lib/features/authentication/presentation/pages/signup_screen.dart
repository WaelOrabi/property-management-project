import 'package:flutter/material.dart';
import '../widgets/signin_signup/button_signin_signup_update.dart';
import '../widgets/signin_signup/iconbutton_for_signin_and_signup_with_other_apps.dart';
import '../widgets/signin_signup/return_button.dart';
import '../widgets/signin_signup/textformfield_signin_signup_updateProfile.dart';
import 'profile.dart';
import 'welcome.dart';

class SignUpScreen extends StatefulWidget {
  static String routeName = 'SignUpScreen';

  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: buildBody(context),
    );
  }

  SafeArea buildBody(BuildContext context) {
    return SafeArea(
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: buildReturnButton(
                fun: () =>
                    Navigator.pushReplacementNamed(context, Welcome.routeName),
                icon: const Icon(Icons.arrow_back_ios)),
          ),
          const Center(
            child: Text(
              'Create new account',
              style: TextStyle(
                color: Colors.green,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Center(
              child: CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(
              Icons.person,
              size: 100,
              color: Colors.grey,
            ),
            radius: 80,
          )),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Column(
              children: [
                TextForm(
                  prefixIcon: false,
                  icon: Icons.edit,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter your first Name";
                    }
                    return null;
                  },
                  controller: firstNameController,
                  keyboardType: TextInputType.name,
                  labelText: "First Name",
                  hintText: "Enter your First Name",
                ),
                const SizedBox(
                  height: 20,
                ),
                TextForm(
                  prefixIcon: false,
                  icon: Icons.edit,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter your last name";
                    }
                    return null;
                  },
                  controller: lastNameController,
                  keyboardType: TextInputType.name,
                  labelText: "Last Name",
                  hintText: "Enter your Last Name",
                ),
                const SizedBox(
                  height: 20,
                ),
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
                const SizedBox(
                  height: 20,
                ),
                TextForm(
                    prefixIcon: false,
                    icon: Icons.phone,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Enter your phone";
                      }
                      return null;
                    },
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                    labelText: "Phone",
                    hintText: "Enter your phone"),
                const SizedBox(
                  height: 20,
                ),
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
                const SizedBox(
                  height: 20,
                ),
                TextForm(
                    prefixIcon: true,
                    icon: Icons.lock,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter password confirmaton';
                      }
                      if (!isPasswordCompliant(passwordController.text)) {
                        return 'Please re-enter password confirmaton';
                      }
                      return null;
                    },
                    controller: passwordConfirmationController,
                    keyboardType: TextInputType.text,
                    labelText: 'Password Confirmaton',
                    hintText: 'Enter your password confirmation'),
                const SizedBox(height: 30),
                ButtonSigninSignupProfile(
                    context: context,
                    height: 40,
                    circle: 50,
                    text: 'Sign Up',
                    fun: () {
                      Navigator.pushReplacementNamed(
                          context, Profile.routeName);
                    },
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    colorText: Colors.white,
                    backGroundColor: Colors.green),
                const SizedBox(
                  height: 30,
                ),
                const Center(
                  child: Text("Or sign up using ..",
                      style: TextStyle(color: Colors.grey)),
                ),
                const SizedBox(height: 25.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildIconFacebookAndGoogle(
                      height: 40,
                      width: 40,
                      linkImage: "assets/images/google.jpg",
                      fun: () {},
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    buildIconFacebookAndGoogle(
                      height: 55,
                      width: 55,
                      linkImage: "assets/images/facebook.jpg",
                      fun: () {},
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }

}