import 'package:flutter/material.dart';
import 'package:project_111/core/widgets/widget_appbar.dart';
import 'package:project_111/features/authentication/presentation/pages/profile.dart';
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
      appBar: WidgetsAppBar.buildAppBar(
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
                padding:EdgeInsets.only(top: 20),
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
                  const SizedBox(height: 30),

                  //button of Update
                  GestureDetector(
                      child: Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width / 2,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.green),
                        child: const Center(
                          child: Text(
                            'Update',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.pushReplacementNamed(
                            context, Profile.routeName);
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

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
            ? const Icon(
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
}
