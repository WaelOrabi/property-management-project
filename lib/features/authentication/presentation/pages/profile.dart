
import 'package:flutter/material.dart';
import '../../../../core/widgets/bottom_navigation_bar.dart';
import '../../../../core/widgets/sizedBox.dart';
import '../../../../core/paramaters.dart';
import 'account_details.dart';
import '../../../../core/widgets/widget_appbar.dart';
import 'admin.dart';
import 'super_admin.dart';
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
    return SafeArea(
      child: Scaffold(
        appBar: buildAppBar(
            namePage: "Profile",
            fun: () {
              Navigator.pushReplacementNamed(
                  context, NavigationBarHome.routeName);
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
           Profile_Picture(image: widget.user!.image,),
          buildSizedBox(context: context, height: 60),
          Text('${widget.user!.firstName} ${widget.user!.lastName}'
            ,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          buildSizedBox(context: context, height: 60),

          buildListTile(
              nameList: "My Listing",
              typeIcon: Icons.format_list_bulleted_sharp,
              colorIcon: Colors.grey,
              fun: () =>
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> MyListingScreen(user: widget.user)))),

          buildListTile(
              nameList: "My Favorites",
              typeIcon: Icons.favorite,
              colorIcon: Colors.grey,
              fun: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> MyFavorite(listProperty:Te.user.listProperty ,)))),

          buildListTile(
              nameList: "Account Details",
              typeIcon: Icons.person,
              colorIcon: Colors.grey,
              fun: () =>
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>AccountDetails(user:widget.user)))),

          buildListTile(
            nameList: "Upgrade Account",
            typeIcon: Icons.edit,
            colorIcon: Colors.grey,
            fun: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>UpdateProfile(user: widget.user!,))),
          ),

          Visibility(
            visible: Te.user.isSuperAdmin==true?true:false,
            child: buildListTile(
            nameList: "Super Admin",
            typeIcon: Icons.admin_panel_settings,
            colorIcon: Colors.grey,
            fun: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>SuperAdmin(user:widget.user))),
          ),),

          buildListTile(
              nameList: "Setting",
              typeIcon: Icons.settings,
              colorIcon: Colors.grey,
            fun: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>const Admin())),
          ),
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
