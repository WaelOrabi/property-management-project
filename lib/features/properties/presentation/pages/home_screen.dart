import 'dart:io';
import 'package:flutter/material.dart';
import 'package:project_111/features/authentication/presentation/pages/profile.dart';
import 'package:project_111/features/properties/presentation/pages/add_or_edit_property.dart';
import 'package:project_111/features/properties/presentation/pages/all_properties_in_map.dart';
import 'package:project_111/tests/tests.dart';
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
        backgroundColor: Colors.white,
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
      backgroundColor: Colors.white,
      centerTitle: true,
      title: const Text(
        'Home',
        style: TextStyle(color: Colors.green, fontSize: 25),
      ),
      leading: GestureDetector(
        child: Padding(
          padding: const EdgeInsets.only(top: 2, left: 15),
          child: CircleAvatar(
            backgroundImage: FileImage(file!),
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
        IconButton(
            onPressed: () => Navigator.pushReplacementNamed(
                context, AddOrEditProperty.routeName),
            icon: const Icon(
              Icons.add,
              color: Colors.green,
            )),
        IconButton(
            onPressed: () =>
                Navigator.push(context,MaterialPageRoute(builder: (context)=>AllPropertiesInMap(listProperty: Te.listProperty1))),
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
                        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ),
                    buildCategories(context,orientation),
                    const Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      child: Text(
                        'All property',
                        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ),
                    widgetListProperty(orientation: orientation, context: context),
                  ],
                )));
      },
    );
  }

  GridView widgetListProperty({required Orientation orientation,required BuildContext context}) {
    return buildGridView(
        orientation: orientation,
        controller: scrollController,
        listProperty: Te.listProperty1,
    context: context
    );
  }


}