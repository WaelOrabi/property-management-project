import 'dart:io';

import 'package:flutter/material.dart';
import 'package:project_111/core/widgets/property.dart';
import 'package:project_111/core/widgets/user.dart';
import 'package:scroll_app_bar/scroll_app_bar.dart';

class MyListingScreen extends StatefulWidget {
  static String routeName='MyListingScreen';
   const MyListingScreen({Key? key,this.user}) : super(key: key);
final User? user;

  @override
  State<MyListingScreen> createState() => _MyListingScreenState();
}

class _MyListingScreenState extends State<MyListingScreen> {

  final controllerAppBar = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildScrollAppBar(context),
      body: buildBody(),
    );
  }

  OrientationBuilder buildBody() {
    return OrientationBuilder(
       builder: (context, orientation) {
    return GridView.count(
      controller: controllerAppBar,
      crossAxisCount:orientation==Orientation.landscape? 2:2,
      primary: false,
      crossAxisSpacing: 0.0,
      mainAxisSpacing: 0.0,
      childAspectRatio:orientation==Orientation.landscape? 1.6:0.8,
      children:widget.user!.listProperty!.map((property){
        return buildCard(property:property);
      }).toList(),
    );
  }
    );
  }

  ScrollAppBar buildScrollAppBar(BuildContext context) {
    return ScrollAppBar(
      controller: controllerAppBar,
      iconTheme: const IconThemeData(color: Color(0xFF444D68)),
      elevation: 1.0,
      backgroundColor: Colors.white,
      centerTitle: true,
      title: const Text(
        'My Listings',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.green,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios_outlined,
          color: Colors.green,
        ),
        onPressed: () {
          Navigator.of(context).pop();

          //Navigator.pushReplacementNamed(context, NavigationBarHome.routeName);
        },
      ),
    );
  }
  Card buildCard({required Property property}){
    return Card(
      elevation: 10,
      shadowColor: Colors.grey[200],
      color: Colors.grey[200],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              width: double.infinity,
              height:150,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          'assets/images/Allepo.jpg'),
                      fit: BoxFit.fill),
                  //   border: Border.all(color: Colors.blue, width: 10 ),
                  borderRadius:
                  BorderRadius.circular(10)),
            ),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Column(
              children: [
                Text(
                  property.price,
                  style:const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),
                ),
                Text(
                  property.address!.country,
                  style:const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),
                ),
                Text(
                  property.address!.city,
                  style:const TextStyle(color: Colors.black,fontSize: 16),
                ),
                Text(
                  property.address!.region,
                  style:const TextStyle(color: Colors.black,fontSize: 14),
                ),
              ],
            ),
          ),



        ],
      ),
    );
  }
}