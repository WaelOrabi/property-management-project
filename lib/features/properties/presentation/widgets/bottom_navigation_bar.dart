import 'package:flutter/material.dart';
import 'package:project_111/features/properties/presentation/pages/home_screen/home_screen.dart';
import '../../../authentication/presentation/pages/signup_screen/signup_screen.dart';
import '../pages/add_property/add_property.dart';
class NavigationBarHome extends StatefulWidget {
  const NavigationBarHome({Key? key}) : super(key: key);
  static String routeName='BottomNavigationBar';

  @override
  State<NavigationBarHome> createState() => _NavigationBarHomeState();
}

class _NavigationBarHomeState extends State<NavigationBarHome> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  int _selectedIndex=0;
  PageController pageController=PageController();

  void onTapped(int index){

    setState(() {
      _selectedIndex=index;
    });
    pageController.jumpToPage(index);
  }

  List <Widget> screen =[
    HomeScreen(),
    AddProperty(),
    SignUpScreen(),
    Container(),
  ];

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:screen[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(items:const <BottomNavigationBarItem> [
        BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.category),label: 'Category'),
        BottomNavigationBarItem(icon: Icon(Icons.message),label: 'Message'),
        BottomNavigationBarItem(icon: Icon(Icons.search),label: 'Search'),
      ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.white,
        onTap: onTapped,
      ),
    );
  }
}
