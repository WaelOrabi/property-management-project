import 'package:flutter/material.dart';
import 'package:project_111/features/authentication/presentation/widgets/update_profile/profile_picture.dart';

import '../profile.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: IconButton(
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed('');
                },
                icon: const Icon(Icons.arrow_back_ios_outlined)),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20, bottom: 10),
            child: Text(
              'Create new account',
              style: TextStyle(
                color: Colors.green,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
           ),

          const Center(child:CircleAvatar(
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

                //button of sign up
                GestureDetector(
                    child: Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.green),
                      child: const Center(
                        child: Text(
                          'Sign Up',
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


                const SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  child: Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.green,
                    ),
                    child:const Center(
                      child: Text('Sign Up',style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),),
                    ),
                  ),
                ),
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
                    Icon_Button(
                      height: 40,
                      width: 40,
                      nameIcon: "assets/images/google.jpg",
                      press: () {},
                    ),
                    const SizedBox(width: 30,),
                    Icon_Button(
                      height: 55,
                     width: 55,
                     nameIcon: "assets/images/facebook.jpg",
                      press: () {},
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

  bool isPasswordCompliant(String password, [int minLength = 6]) {
    if (password.isEmpty) {
      return false;
    }

    bool hasUppercase = password.contains(RegExp(r'[A-Z]'));
    bool hasDigits = password.contains(RegExp(r'[0-9]'));
    bool hasLowercase = password.contains(RegExp(r'[a-z]'));
    bool hasSpecialCharacters =
        password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
    bool hasMinLength = password.length > minLength;

    return (hasDigits ||
            hasUppercase ||
            hasLowercase ||
            hasSpecialCharacters) &&
        hasMinLength;
  }

  // ignore: non_constant_identifier_names
  TextFormField TextForm(
      {required FormFieldValidator<String>? validator,
      required TextEditingController controller,
      required TextInputType? keyboardType,
      required String labelText,
      required IconData icon,
      required bool prefixIcon,
      required String hintText}) {
    return TextFormField(
      cursorColor: Colors.green,
      obscureText: false,
      controller: controller,
      onSaved: (newValue) {
        controller.text = newValue!;
      },
      validator: validator,
      keyboardType: keyboardType,
      style: const TextStyle(fontWeight: FontWeight.w400, color: Colors.black),
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        labelText: labelText,
        hintText: hintText,
        // ignore: unnecessary_null_comparison
        prefixIcon: Icon(
                icon,
              ),
        // ignore: unnecessary_null_comparison
        suffixIcon: prefixIcon == true
            ?const Icon(
                Icons.visibility,
              )
            : null,
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(50),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.green,
            width: 2,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(50),
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget Icon_Button(
      {
      required VoidCallback press,
      required double height,
      required double width,
      required String nameIcon}) {
    return GestureDetector(
      onTap: press,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
        ),
        child: Image.asset(nameIcon),
      ),
    );
  }
}
