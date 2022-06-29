import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_111/core/widgets/bottom_navigation_bar.dart';
import 'package:project_111/core/widgets/sizedBox.dart';
import 'package:project_111/features/authentication/presentation/pages/account_details.dart';
import 'package:project_111/core/widgets/widget_appbar.dart';
import 'package:project_111/features/authentication/presentation/pages/update_peofile.dart';
import 'package:project_111/features/authentication/presentation/widgets/update_profile/profile_picture.dart';
import 'package:project_111/features/properties/presentation/pages/my_favorite.dart';
import '../../../properties/presentation/pages/MyListingScreen.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);
  static String routeName = 'Profile';

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String userName = 'User name';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: buildAppBar(
            namePage: "Profile",
            fun: () {
              Navigator.pushReplacementNamed(context,NavigationBarHome.routeName);
            },
            color: Colors.white),
        body: _buildBody(context),
      ),
    );
  }

  SingleChildScrollView _buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          buildSizedBox(context: context, height: 60),
          //image_profile
          const Profile_Picture(),
          buildSizedBox(context: context, height: 60),
          Text(
            userName,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          buildSizedBox(context: context, height: 60),

          buildListTile(
              nameList: "My Listing",
              typeIcon: Icons.format_list_bulleted_sharp,
              colorIcon: Colors.greenAccent,
              fun: () =>
                  Navigator.pushNamed(context, MyListingScreen.routeName)),

          buildListTile(
              nameList: "My Favorites",
              typeIcon: Icons.favorite,
              colorIcon: Colors.red,
              fun: () => Navigator.pushNamed(
                  context, MyFavorite.routeName)),

          buildListTile(
              nameList: "Account Details",
              typeIcon: Icons.person,
              colorIcon: Colors.blue,
              fun: () => Navigator.pushNamed(
                  context, AccountDetails.routeName)),

          buildListTile(
            nameList: "Upgrade Account",
            typeIcon: Icons.edit,
            colorIcon: Colors.yellow,
            fun: () => Navigator.pushNamed(
                context, UpdateProfile.routeName),
          ),

          buildListTile(
              nameList: "Setting",
              typeIcon: Icons.settings,
              colorIcon: Colors.grey,
              fun: () {}),

          buildListTile(
              nameList: "Super Admin",
              typeIcon: Icons.admin_panel_settings,
              colorIcon: Colors.indigo,
              fun: () {}),


          //Button of Log out
          _buildLogoutBtn(context),
        ],
      ),
    );
  }

  //Button of Log out
  GestureDetector _buildLogoutBtn(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.width / 25,
            horizontal: MediaQuery.of(context).size.height / 25),
        padding: const EdgeInsets.all(15),
        width: MediaQuery.of(context).size.width - 10,
        decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey.shade300)),
        child: const Center(
          child: Text(
            "Logout",
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      onTap: () {},
    );
  }

  ListTile buildListTile(
      {required String nameList,
      required IconData typeIcon,
      required Color colorIcon,
      required VoidCallback fun}) {
    return ListTile(
      leading: Icon(
        typeIcon,
        color: colorIcon,
      ),
      title: Text(nameList),
      onTap: fun,
    );
  }
}
