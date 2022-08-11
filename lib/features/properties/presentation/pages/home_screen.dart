import 'dart:io';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:project_111/features/properties/presentation/pages/search.dart';
import 'package:project_111/features/authentication/presentation/pages/search_user.dart';
import '../../../authentication/presentation/pages/profile.dart';
import 'add_or_update_property.dart';
import 'all_properties_in_map.dart';
import '../../../../tests/tests.dart';
import 'package:scroll_app_bar/scroll_app_bar.dart';
import '../widgets/home_widget/category_widget.dart';
import '../widgets/myListing_myFavorite_homeScreen_widget/buildGridView.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = 'HomeScreen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  ScrollController scrollController = ScrollController();
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor:Theme.of(context).backgroundColor,
        key: _key,
        drawer: Drawer(child: Profile(user: Te.user)),
        appBar: buildScrollAppBar(),
        body: _buildBody(context),
      ),
    );
  }

  ScrollAppBar buildScrollAppBar() {
    File? file = Te.user.image;
    return ScrollAppBar(
      controller: scrollController,
      elevation: 0,
      toolbarHeight: 70,
      title:  Text(
        'Home',
      style:  Theme.of(context).appBarTheme.textTheme!.bodyText1,
      ),
      leading: GestureDetector(
        child: Padding(
          padding: const EdgeInsets.only(top: 2, left: 15),
          child:file==null?const CircleAvatar(
            backgroundImage:AssetImage('assets/images/download.png') ,
            radius: 50,
          ): CircleAvatar(
            backgroundImage: FileImage(file),
            radius: 50,
          ),
        ),
        onTap: () {
          //*********************************************
          //request for fetch information user
          //**********************************************
          _key.currentState!.openDrawer();
        },
      ),
      actions: [

               DropdownButtonHideUnderline(
                child: DropdownButton2(
                  customButton: const Icon(
                    Icons.search,
                    color: Colors.green,
                  ),
                  customItemsIndexes: const [2],
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

        IconButton(
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        AllPropertiesInMap(listProperty: Te.listProperty1))),
            icon: const Icon(
              Icons.map,
              color: Colors.green,
            )),
      ],
    );
  }

  Widget _buildBody(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        return Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: SingleChildScrollView(
                controller: ScrollController(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      child: Text(
                        'Categories',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    buildCategories(context, orientation),
                    const Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      child: Text(
                        'All properties',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    widgetListProperty(
                        orientation: orientation, context: context),
                  ],
                )));
      },
    );
  }

  GridView widgetListProperty(
      {required Orientation orientation, required BuildContext context}) {
    return buildGridView(
      delete: false,
        orientation: orientation,
        controller: scrollController,
        listProperty: Te.listProperty1,
        context: context);
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
  static const List<MenuItem> firstItems = [users, properties];

  static const users = MenuItem(text: 'Users', icon: Icons.person);
  static const properties = MenuItem(text: 'Properties', icon: Icons.home);

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
            color: Colors.green,
          ),
        ),
      ],
    );
  }

  static onChanged(BuildContext context, MenuItem item) {
    switch (item) {
      case MenuItems.users:Navigator.pushNamed(context,SearchUser.routeName);
        break;
      case MenuItems.properties:Navigator.pushNamed(context, Search.routeName);
        break;
    }
  }
}
