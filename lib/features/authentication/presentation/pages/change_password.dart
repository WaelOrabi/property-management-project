import 'package:flutter/material.dart';
import '../../../../core/widgets/widget_appbar.dart';
import '../widgets/signin_signup/button_signin_signup_update.dart';
import '../widgets/signin_signup/textformfield_signin_signup_updateProfile.dart';

class ChangePassword extends StatefulWidget {
  static String routeName = 'ChangePassword';
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmNewPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      backgroundColor:Theme.of(context).backgroundColor,
      appBar:buildAppBar(
          namePage: "Change Password",
          fun: () => Navigator.of(context).pop(),
          color: Colors.white),
      body: _buildBody(context),
    );
  }

  SafeArea _buildBody(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextForm(
                      controller: oldPasswordController,
                      prefixIcon: false,
                      icon: Icons.lock,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please Enter your old password";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.visiblePassword,
                      labelText: "Old Password",
                      hintText: "Enter your old password",
                    ),
                    const SizedBox(height: 20,),
                    TextForm(
                      controller: newPasswordController,
                      prefixIcon: false,
                      icon: Icons.lock,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please Enter your new password";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.visiblePassword,
                      labelText: "new password",
                      hintText: "Enter your new password",
                    ),
                   const SizedBox(height: 20,),
                    TextForm(
                        controller: confirmNewPasswordController,
                        prefixIcon: false,
                        icon: Icons.lock,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please Enter your new password";
                          }
                          return null;
                        },
                        keyboardType: TextInputType.visiblePassword,
                        labelText: "Confirm new password",
                        hintText: "Enter your new password"),
                   const SizedBox(height: 30,),
                    ButtonSigninSignupProfile(
                        context: context,
                        height: 50,
                        width: 2,
                        circle: 50,
                        text: 'Save',
                        fun: () {
                          if(_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            Navigator.of(context).pop();
                          }                       }),
                    //button of Update

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}