import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:project_111/core/paramaters.dart';
import 'package:project_111/features/properties/presentation/widgets/myListing_myFavorite_homeScreen_widget/buildGridView.dart';
import 'package:project_111/tests/tests.dart';

class UserProfile extends StatefulWidget {
  static const routeName = 'UserProfile';
  final Users user;

  UserProfile({Key? key, required this.user}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: buildAppBar(context),
      body: buildBody(context),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_outlined,
            color: Colors.green,
          )),
      actions: [
        Visibility(
            visible: widget.user.isSuperAdmin==true?true:false,
            child:
                  DropdownButtonHideUnderline(
                    child: DropdownButton2(
                      customButton: const Icon(
                        Icons.more_vert,
                        color: Colors.green,
                      ),
                      customItemsIndexes: const [3],
                      customItemsHeight: 8,
                      items: [
                        ...MenuItems.firstItems.map(
                              (item) =>
                              DropdownMenuItem<MenuItem>(
                                value: item,
                                child: MenuItems.buildItem(item),
                              ),
                        ),
                        const DropdownMenuItem<Divider>(enabled: false, child: Divider()),

                      ],
                      onChanged: (value) {
                        MenuItems.onChanged(context, value as MenuItem);
                      },
                      itemHeight: 48,
                      itemPadding: const EdgeInsets.only(left: 16, right: 16),
                      dropdownWidth: 160,
                      dropdownPadding: const EdgeInsets.symmetric(vertical: 6),
                      dropdownDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Theme.of(context).backgroundColor,
                      ),
                      dropdownElevation: 8,
                      offset: const Offset(0, 8),
                    ),
                  ),

                  // var ad = AlertDialog(
                  //   title:const Text("Do you want to :"),
                  //   content: SizedBox(
                  //     height: 150,
                  //     child: Column(
                  //       children: [
                  //         const Divider(
                  //           height: 10,
                  //         ),
                  //         Container(
                  //           color: Colors.green,
                  //           child: ListTile(
                  //             leading:const  Icon(   Icons.star,color: Colors.white,),
                  //             title:const  Text("Set as admin"),
                  //             onTap: () =>AwesomeDialog(
                  //               context: context,
                  //               animType: AnimType.SCALE,
                  //               dialogType: DialogType.QUESTION,
                  //               title: 'Admin',
                  //               desc: Te.user.isAdmin==false?'Do you want to set this user as an admin ?':'Do you want to remove this user from admin?',
                  //               btnOkOnPress: () {
                  //                 setState(() {
                  //                   Navigator.of(context).pop();
                  //                 });
                  //               },
                  //             )..show(),
                  //
                  //
                  //           ),
                  //         ),
                  //         SizedBox(height: 10,),
                  //         Container(
                  //           color: Colors.orange,
                  //           child: ListTile(
                  //             leading:const Icon(Icons.block,color: Colors.white,),
                  //             title: const Text("Block this user"),
                  //             onTap: ()=> AwesomeDialog(
                  //               context: context,
                  //               animType: AnimType.SCALE,
                  //               dialogType: DialogType.WARNING,
                  //               title: 'ِBlock',
                  //               desc: 'Do you want to block this user?',
                  //               btnOkOnPress: () {
                  //                 setState(() {
                  //                   Navigator.of(context).pop();
                  //                 });
                  //               },
                  //             )..show(),
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // );
                  // showDialog(context: context, builder: (_) => ad);

            ),
      ],
    );
  }

  SingleChildScrollView buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 50,
          ),
          widget.user.image==null?
          const CircleAvatar(
            backgroundImage: AssetImage('assets/images/download.png'),
            radius: 100,
          ):
          CircleAvatar(
            backgroundImage: FileImage(widget.user.image!, scale: 1),
            radius: 100,
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.user.firstName! + ' ' + widget.user.lastName!,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          if (widget.user.isAdmin == true || widget.user.isSuperAdmin == true)
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: widget.user.isSuperAdmin == true
                          ? const Icon(
                              Icons.stars,
                              color: Colors.blueAccent,
                            )
                          : widget.user.isAdmin == true
                              ? const Icon(
                                  Icons.star,
                                  color: Colors.blueAccent,
                                )
                              : const Text(''),
                    ),
                    Text(widget.user.isSuperAdmin == true
                        ? 'Super Admin'
                        : widget.user.isAdmin == true
                            ? 'Admin'
                            : ''),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          widget.user.listProperty!.isEmpty
              ? const Center(
                  child: Text(
                    "There are not any properties",
                    style: TextStyle(fontSize: 20),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: OrientationBuilder(builder: (context, orientation) {
                    return buildGridView(
                      delete: false,
                        orientation: orientation,
                        controller: scrollController,
                        listProperty: widget.user.listProperty,
                        context: context);
                  }),
                ),
        ],
      ),
    );
  }


}

class MenuItem {
  final String text;
  final IconData icon;

  const MenuItem({
    required this.text,
    required this.icon,
  });
}

class MenuItems {
  static const List<MenuItem> firstItems = [superAdmin, admin,blockUser];

  static const superAdmin = MenuItem(text: 'Super Admin', icon: Icons.stars);
  static const admin = MenuItem(text: 'Admin', icon: Icons.star);
  static const blockUser = MenuItem(text: 'Block User', icon: Icons.delete);
  static Widget buildItem(MenuItem item) {
    return Row(
      children: [
        Icon(
            item.icon,
            color: Colors.green,
            size: 22
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          item.text,
          style: const TextStyle(
            fontSize: 15,
            color: Colors.green,
          ),
        ),
      ],
    );
  }

  static onChanged(BuildContext context, MenuItem item) {
    switch (item) {
      case MenuItems.superAdmin:AwesomeDialog(
        context: context,
        animType: AnimType.SCALE,
        dialogType: DialogType.QUESTION,
        title: 'SuperAdmin',
        desc: Te.user.isSuperAdmin==false?'Do you want to set this user as a super admin ?':'Do you want to remove this user from super admin?',
        btnOkOnPress: () {
            Navigator.of(context).pop();
        },
      ).show();
      break;
      case MenuItems.admin:AwesomeDialog(
        context: context,
        animType: AnimType.SCALE,
        dialogType: DialogType.QUESTION,
        title: 'Admin',
        desc: Te.user.isAdmin==false?'Do you want to set this user as an admin ?':'Do you want to remove this user from admin?',
        btnOkOnPress: () {
            Navigator.of(context).pop();
        },
      ).show();
      break;
      case MenuItems.blockUser:AwesomeDialog(
        context: context,
        animType: AnimType.SCALE,
        dialogType: DialogType.QUESTION,
        title: 'Block',
        desc:'Do you want to block this user?',
        btnOkOnPress: () {
          Navigator.of(context).pop();
        },
      ).show();
      break;
    }
  }
}