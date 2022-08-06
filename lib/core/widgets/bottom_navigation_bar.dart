import 'package:flutter/material.dart';
import 'package:project_111/features/properties/presentation/pages/add_or_update_property.dart';
import '../../features/conversation/presntation/pages/conversations.dart';
import '../../features/properties/presentation/pages/home_screen.dart';
import '../../features/properties/presentation/pages/notification.dart';
import '../../features/properties/presentation/pages/search.dart';
import '../../tests/tests.dart';
class NavigationBarHome extends StatefulWidget {
  const NavigationBarHome({Key? key}) : super(key: key);
  static String routeName='BottomNavigationBar';

  @override
  State<NavigationBarHome> createState() => _NavigationBarHomeState();
}

class _NavigationBarHomeState extends State<NavigationBarHome> {
  int _selectedIndex=0;
  PageController pageController=PageController();

  void onTapped(int index){

    setState(() {
      _selectedIndex=index;
    });
    if (pageController.hasClients) {
      pageController.jumpToPage(index);
    }
  }

  List <Widget> screen =[
    const HomeScreen(),
   const PageNotification(),
     Conversations(useres: Te.listUser1,),
     AddOrUpdateProperty(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:screen[_selectedIndex],
      bottomNavigationBar: Theme(

        data:Theme.of(context).copyWith(
          // sets the background color of the `BottomNavigationBar`
            canvasColor: Theme.of(context).bottomNavigationBarTheme.backgroundColor),
        child: BottomNavigationBar(items:const <BottomNavigationBarItem> [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
          BottomNavigationBarItem(icon:Icon(Icons.notifications_none_outlined),label: 'Notifications'),
          BottomNavigationBarItem(icon: Icon(Icons.message),label: 'Message'),
          BottomNavigationBarItem(icon: Icon(Icons.add),label: 'Add Property'),
        ],
          currentIndex: _selectedIndex,
          onTap: onTapped,
        ),
      ),
    );
  }
}
