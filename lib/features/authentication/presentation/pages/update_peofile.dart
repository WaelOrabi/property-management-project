import 'package:flutter/material.dart';
import 'package:project_111/core/widgets/sizedBox.dart';
import 'package:project_111/core/widgets/user.dart';
import 'package:project_111/core/widgets/widget_appbar.dart';
import 'package:project_111/features/authentication/presentation/pages/profile.dart';
import 'package:project_111/features/authentication/presentation/widgets/signin_signup/button_signin_signup_update.dart';
import '../widgets/signin_signup/textformfield_signin_signup_updateProfile.dart';
import '../widgets/update_profile/profile_picture.dart';

class UpdateProfile extends StatefulWidget {
  static String routeName = 'UpdateProfile';
final User user;
  const UpdateProfile({Key? key, required this.user}) : super(key: key);

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    firstNameController.text=widget.user.firstName!;
    lastNameController.text=widget.user.lastName!;
    phoneController.text=widget.user.phoneNumber!;
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar:buildAppBar(
          namePage: "Update Profile",
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
            Center(
              child: Padding(
                padding:const EdgeInsets.only(top: 20),
                child: Profile_Picture(image: widget.user.image,),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextForm(
                      controller: firstNameController,
                      prefixIcon: false,
                      icon: Icons.edit,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please Enter your first Name";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.name,
                      labelText: "First Name",
                      hintText: "Enter your First Name",
                    ),
                    buildSizedBox(context: context,height:60),
                    TextForm(
                      controller: lastNameController,
                      prefixIcon: false,
                      icon: Icons.edit,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please Enter your last name";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.name,
                      labelText: "Last Name",
                      hintText: "Enter your Last Name",
                    ),
                    buildSizedBox(context: context,height:60),
                    TextForm(
                      controller: phoneController,
                        prefixIcon: false,
                        icon: Icons.phone,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please Enter your phone";
                          }
                          return null;
                        },
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
                          if(_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            print(firstNameController.text);
                            print(lastNameController.text);
                            print(phoneController.text);
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
