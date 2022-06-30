import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
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
  double ? _ratingValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScrollAppBar(
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
      ),
      body: OrientationBuilder(
         builder: (context, orientation) {
      return GridView.count(
        controller: controllerAppBar,
        crossAxisCount:orientation==Orientation.landscape? 4:2,
        primary: false,
        crossAxisSpacing: 0.0,
        mainAxisSpacing: 0.0,
        childAspectRatio: 0.8,
        children: [
          buildCard(),
          buildCard(),
          buildCard(),
          buildCard(),
          buildCard(),
          buildCard(),
          buildCard(),
          buildCard(),
        ],
      );
    }
      ),
    );
  }
  Card buildCard(){
    return Card(
      color: Colors.grey[200],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(

                  child: Image.asset('assets/images/home.jpg',fit: BoxFit.cover,),
                  height: 160,
                  width: 300,
                ),
              ),
              Positioned(
                  right: 10,
                  child: IconButton(
                      onPressed: () {}, icon: Icon(Icons.favorite,color: Colors.green,))),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text(
              '${'1000\$ Home'}',
              style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text(
              '${'Syria,Damascus'}',
              style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 7,right: 20),
            child: RatingBar(
                itemSize: 30,
                initialRating: 0,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                ratingWidget: RatingWidget(
                    full: const Icon(Icons.star, color: Colors.green),
                    half: const Icon(
                      Icons.star_half,
                      color: Colors.green,
                    ),
                    empty: const Icon(
                      Icons.star_outline,
                      color: Colors.green,
                    )),
                onRatingUpdate: (value) {
                  setState(() {
                    _ratingValue = value;
                  });
                }),
          ),

        ],
      ),
    );
  }
}