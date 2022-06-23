import 'package:flutter/material.dart';
import 'package:project_111/core/widgets/sizedBox.dart';
import 'package:project_111/core/widgets/widget_appbar.dart';
import 'package:project_111/features/authentication/presentation/pages/profile.dart';
import 'package:project_111/features/authentication/presentation/widgets/signin_signup/button_signin_signup_update.dart';
import '../widgets/signin_signup/textformfield_signin_signup_updateProfile.dart';
import '../widgets/update_profile/profile_picture.dart';

class UpdateProfile extends StatefulWidget {
  static String routeName = 'UpdateProfile';

  const UpdateProfile({Key? key}) : super(key: key);

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar:buildAppBar(
          namePage: "Update Profile",
          fun: () => Navigator.pushReplacementNamed(context, Profile.routeName),
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
            const Center(
              child: Padding(
                padding: EdgeInsets.only(top: 20),
                child: Profile_Picture(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
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
                  buildSizedBox(context: context,height:60),
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
                  buildSizedBox(context: context,height:60),
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
                  buildSizedBox(context:context,height:20),
                  ButtonSigninSignupProfile(
                      context: context,
                      height: 50,
                      width: 2,
                      circle: 50,
                      text: 'Update',
                      fontWeight: FontWeight.bold,
                      colorText: Colors.white,
                      backGroundColor: Colors.green,
                      fun: () {
                        Navigator.pushReplacementNamed(
                            context, Profile.routeName);
                      }),
                  //button of Update

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
