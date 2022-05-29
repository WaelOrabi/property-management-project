import 'package:flutter/material.dart';
import 'package:project_111/features/authentication/presentation/pages/profile.dart';
import 'package:project_111/features/properties/presentation/pages/add_property/add_property.dart';
import 'package:project_111/features/properties/presentation/pages/map_screen/map_screen.dart';
import 'package:scroll_app_bar/scroll_app_bar.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = 'HomeScreen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController controller = ScrollController();
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
@override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _key,
        drawer: const Drawer(child: Profile()),
        appBar: buildScrollAppBar(),
        body:Center(child: Text('ayham'),),
      ),
    );
  }

  ScrollAppBar buildScrollAppBar() {
    return ScrollAppBar(
      controller: controller,
      toolbarHeight: 70,
      backgroundColor: Colors.white,
      centerTitle: true,
      title: const Text(
        'Home',
        style: TextStyle(color: Colors.green, fontSize: 25),
      ),
      leading: GestureDetector(
        child: const Padding(
          padding: EdgeInsets.only(top: 2, left: 15),
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/images/home.jpg'),
            radius: 50,
          ),
        ),
        onTap: () => _key.currentState!.openDrawer(),
      ),
      actions: [
        IconButton(
            onPressed: () =>
                Navigator.pushReplacementNamed(context, AddProperty.routeName),
            icon: const Icon(
              Icons.add,
              color: Colors.green,
            )),
        IconButton(
            onPressed: () =>
                Navigator.pushNamed(context, MapScreen.routeName),
            icon: const Icon(
              Icons.map,
              color: Colors.green,
            )),
      ],
    );
  }
}
