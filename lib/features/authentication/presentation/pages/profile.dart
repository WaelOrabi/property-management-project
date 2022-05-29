import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_111/features/authentication/presentation/pages/account_details.dart';
import 'package:project_111/core/widgets/widget_appbar.dart';
import 'package:project_111/features/authentication/presentation/pages/update_peofile.dart';
import 'package:project_111/features/authentication/presentation/widgets/update_profile/profile_picture.dart';
import 'package:project_111/features/properties/presentation/pages/add_property/add_property.dart';
import 'package:project_111/features/properties/presentation/pages/my_favorite/my_favorite.dart';
import '../../../properties/presentation/pages/mylistings_screen/MyListingScreen.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);
  static String routeName = 'Profile';
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  File? image;

  Future getImage(ImageSource src) async {
    final pickedFile = await ImagePicker().pickImage(source: src);
    setState(() {
      if (pickedFile != null) {
        image = File(pickedFile.path);
      }
    });
    return image;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: WidgetsAppBar.buildAppBar(namePage: "Profile",
              fun: (){
            Navigator.of(context).pop();
              },color: Colors.white),
          body: _buildBody(context),
        ),
    );
  }


  SingleChildScrollView _buildBody(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
           const SizedBox(height: 10,),
           //image_profile
            const Profile_Picture(),
            const  SizedBox(height: 10,),
            const Text("User name", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
           const SizedBox(height: 20),


            buildListTile(
                nameList: "My Listing",
                typeIcon: Icons.format_list_bulleted_sharp,
                colorIcon: Colors.greenAccent,
                fun: () =>Navigator.pushReplacementNamed(context,MyListingScreen.routeName)),

            buildListTile(
                nameList: "My Favorites",
                typeIcon: Icons.favorite,
                colorIcon: Colors.red,
                fun: () =>Navigator.pushReplacementNamed(context, MyFavorite.routeName)),

            buildListTile(
                nameList: "Account Details",
                typeIcon: Icons.person,
                colorIcon: Colors.blue,
                fun:()=> Navigator.pushReplacementNamed(context, AccountDetails.routeName)),

            buildListTile(
                nameList: "Upgrade Account",
                typeIcon: Icons.edit,
                colorIcon: Colors.yellow,
                fun: () =>Navigator.pushReplacementNamed(context, UpdateProfile.routeName),),

            buildListTile(
                nameList: "Setting",
                typeIcon: Icons.settings,
                colorIcon: Colors.grey,
                fun: () {}),

            //Button of Log out
            _buildLogoutBtn(context),
          ],
        ),
      );
  }


  //image profile
  Center _buildImageProfile(BuildContext context) {
    return Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 150,
                    width: 150,
                    child: Stack(
                      fit: StackFit.expand,
                      clipBehavior: Clip.none,
                      children: [
                        image == null
                            ? const CircleAvatar(
                                backgroundColor: Colors.white,
                                child: Icon(
                                  Icons.person,
                                  size: 100,
                                  color: Colors.grey,
                                ),
                                radius: 150,
                              )
                            : CircleAvatar(
                                backgroundImage: FileImage(image!),
                                radius: 130,
                              ),
                        Positioned(
                          left: 100,
                          top: 100,
                          child: IconButton(
                            icon: const Icon(Icons.add_a_photo),
                            color: Colors.green,
                            iconSize: 30,
                            onPressed: () {
                              var ad = AlertDialog(
                                title: const Text("chose photo from :"),
                                content: SizedBox(
                                  height: 150,
                                  child: Column(
                                    children: [
                                      const Divider(
                                        height: 10,
                                      ),
                                      Container(
                                        color: Theme.of(context).primaryColor,
                                        child: ListTile(
                                          leading: const Icon(Icons.photo),
                                          title: const Text("Gallery"),
                                          onTap: () {
                                            getImage(ImageSource.gallery);
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        color: Theme.of(context).primaryColor,
                                        child: ListTile(
                                          leading: const Icon(Icons.add_a_photo),
                                          title: const Text("Camera"),
                                          onTap: () {
                                            getImage(ImageSource.camera);
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                              showDialog(context: context, builder: (_) => ad);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            );
  }


  //Button of Log out
  GestureDetector _buildLogoutBtn(BuildContext context) {
    return GestureDetector(
              child:Container(
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(8),
                width: MediaQuery.of(context).size.width-10,
                decoration: BoxDecoration(
                    borderRadius:BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey.shade300)),
                child:const  Center(
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
