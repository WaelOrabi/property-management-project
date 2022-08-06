import 'package:flutter/material.dart';
import 'package:project_111/core/setting/setting.dart';
import 'package:project_111/features/authentication/presentation/widgets/signin_signup/button_signin_signup_update.dart';
import '../../../../core/widgets/bottom_navigation_bar.dart';
import '../../../../core/paramaters.dart';
import '../widgets/profile/profile_widget.dart';
import 'account_details.dart';
import '../../../../core/widgets/widget_appbar.dart';
import 'update_peofile.dart';
import '../widgets/update_profile/profile_picture.dart';
import '../../../properties/presentation/pages/my_favorite.dart';
import '../../../../tests/tests.dart';
import '../../../properties/presentation/pages/MyListingScreen.dart';

// ignore: must_be_immutable
class Profile extends StatefulWidget {
  Profile({Key? key, this.user}) : super(key: key);
  static String routeName = 'Profile';
  User? user;

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: buildAppBar(
        namePage: "Profile",
        fun: () {
          Navigator.pushReplacementNamed(context, NavigationBarHome.routeName);
        },
      ),
      body: _buildBody(context),
    );
  }

  SingleChildScrollView _buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 30,
          ),
          //image_profile
          Profile_Picture(
            image: widget.user!.image,
          ),
          const SizedBox(
            height: 40,
          ),
          Text(
            '${widget.user!.firstName} ${widget.user!.lastName}',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 30,
          ),

          buildListTile(
            context: context,
              nameList: "My Listing",
              typeIcon: Icons.format_list_bulleted_sharp,
              fun: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          MyListingScreen(user: widget.user)))),
          buildListTile(
            context: context,
              nameList: "My Favorites",
              typeIcon: Icons.favorite,
              fun: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MyFavorite(
                            listProperty: Te.user.listProperty,
                          )))),
          buildListTile(
            context:context ,
              nameList: "Account Details",
              typeIcon: Icons.person,
              fun: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          AccountDetails(user: widget.user)))),
          buildListTile(
            context: context,
            nameList: "Upgrade Account",
            typeIcon: Icons.edit,
            fun: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => UpdateProfile(
                          user: widget.user!,
                        ))),
          ),


          buildListTile(
            context: context,
            nameList: "Setting",
            typeIcon: Icons.settings,
            fun: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Setting())),
          ),
          const SizedBox(
            height: 10,
          ),
          ButtonSigninSignupProfile(
              context: context,
              text: "Logout",
              fun: () {},
              width: 1.8,
              circle: 10,
              borderColor: Colors.grey.shade300),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }


}
