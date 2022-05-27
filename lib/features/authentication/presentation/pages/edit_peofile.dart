import 'package:flutter/material.dart';
import 'package:project_111/core/widgets/widget_appbar.dart';
import 'package:project_111/features/authentication/presentation/pages/profile.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: WidgetsAppBar.buildAppBar(
          namePage: 'Edit Profile',
          fun: () => Navigator.pushNamed(context, Profile.routeName),
          color: Colors.white,
        ),
        body: _buildBody(),
      ),
    );
  }

  Padding _buildBody() {
    return Padding(
      padding:const EdgeInsets.all(10),
      child: Column(
        children: [

        ],
      ),
    );
  }
}
