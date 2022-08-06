import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import '../../../../core/widgets/bottom_navigation_bar.dart';
import '../../../../core/widgets/location_helper.dart';
import '../widgets/signin_signup/button_signin_signup_update.dart';
import '../widgets/signin_signup/return_button.dart';
import '../widgets/signin_signup/textformfield_signin_signup_updateProfile.dart';
import 'welcome.dart';

class SignUpScreen extends StatefulWidget {
  static String routeName = 'SignUpScreen';

  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  static Position? position;

  Future<void> getMyCurrentLocation() async {
    await LocationHelper.determineCurrentLocation();
    position = await Geolocator.getLastKnownPosition().whenComplete(() {
      setState(() {});
    });
  }

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool obscureTextPassword=false;
  bool obscureTextConformPassword=false;
  @override
  void initState() {
    super.initState();
    getMyCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
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
                padding:
                EdgeInsets.only(top: MediaQuery
                    .of(context)
                    .size
                    .height / 20),
                child: buildReturnButton(
                    fun: () =>
                        Navigator.pushReplacementNamed(
                            context, Welcome.routeName),
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
                padding: EdgeInsets.only(
                    left: MediaQuery
                        .of(context)
                        .size
                        .width / 30,
                    right: MediaQuery
                        .of(context)
                        .size
                        .width / 30,
                    top: MediaQuery
                        .of(context)
                        .size
                        .height / 30),
                child: Form(
                  key:_formKey ,
                  child: Column(
                    children: [
                      TextForm(
                        suffixIcon: false,
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
                      SizedBox(height: MediaQuery.of(context).size.height/60,),
                      TextForm(
                        suffixIcon: false,
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
                      SizedBox(height: MediaQuery.of(context).size.height/60,),
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
                      SizedBox(height: MediaQuery.of(context).size.height/60,),
                      TextForm(
                          suffixIcon: false,
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
                      SizedBox(height: MediaQuery.of(context).size.height/60,),
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
                      SizedBox(height: MediaQuery.of(context).size.height/60,),
                      TextForm(
                          fun: (){
                            setState(() {
                              obscureTextConformPassword=!obscureTextConformPassword;
                            });
                          },
                          obscureText: obscureTextConformPassword,
                          suffixIcon: true,
                          icon: Icons.lock,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter password confirmaton';
                            }
                            if (!isPasswordCompliant(passwordController.text)) {
                              return 'Please re-enter password confirmaton';
                            }if(passwordController.text != passwordConfirmationController.text) {
                              return 'Password does not match';
                            }
                            return null;
                          },
                          controller: passwordConfirmationController,
                          keyboardType: TextInputType.text,
                          labelText: 'Password Confirmaton',
                          hintText: 'Enter your password confirmation'),

                      SizedBox(height: MediaQuery.of(context).size.height/20,),
                      ButtonSigninSignupProfile(
                          context: context,
                          text: 'Sign Up',
                          fun: () async {
                            if(_formKey.currentState!.validate()) {
                              // Map<String,
                              //     dynamic> mapLocationAddress = await LocationHelper
                              //     .getLocationAddress(
                              //     position!.latitude, position!.longitude);
                              // Address address = Address(
                              //     latitude: position!.latitude,
                              //     longitude: position!.longitude,
                              //     region: mapLocationAddress["subLocality"],
                              //     city: mapLocationAddress["administrativeArea"],
                              //     country: mapLocationAddress["country"]);
                              // User(
                              //     firstName: firstNameController.text,
                              //     lastName: lastNameController.text,
                              //     email: emailController.text,
                              //     phoneNumber: phoneController.text,
                              //     password: passwordController.text,
                              //     address: address);


                              Navigator.pushReplacementNamed(
                                  context, NavigationBarHome.routeName);
                            }
                          },



                          fontWeight: FontWeight.bold,
                          colorText: Colors.white,
                          backGroundColor: Colors.green),
                      SizedBox(height: MediaQuery.of(context).size.height/20,),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}