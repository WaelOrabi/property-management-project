<<<<<<< HEAD
import 'dart:io';

=======
import 'package:awesome_dialog/awesome_dialog.dart';
>>>>>>> b0707cdd8e03c0386b98e1fb5545e62e3de663ea
import 'package:flutter/material.dart';
import 'package:project_111/core/widgets/property.dart';
import 'package:project_111/core/widgets/user.dart';
import 'package:project_111/features/properties/presentation/pages/add_or_edit_property.dart';
import 'package:project_111/tests/tests.dart';
import 'package:scroll_app_bar/scroll_app_bar.dart';

class MyListingScreen extends StatefulWidget {
<<<<<<< HEAD
  static String routeName='MyListingScreen';
   const MyListingScreen({Key? key,this.user}) : super(key: key);
final User? user;
=======
  static String routeName = 'MyListingScreen';

  const MyListingScreen({Key? key, this.user}) : super(key: key);
  final User? user;
>>>>>>> b0707cdd8e03c0386b98e1fb5545e62e3de663ea

  @override
  State<MyListingScreen> createState() => _MyListingScreenState();
}

class _MyListingScreenState extends State<MyListingScreen> {
  final controllerAppBar = ScrollController();
<<<<<<< HEAD
=======
  double? _ratingValue;

>>>>>>> b0707cdd8e03c0386b98e1fb5545e62e3de663ea
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
<<<<<<< HEAD
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
=======
      body: OrientationBuilder(builder: (context, orientation) {
        return GridView.count(
          controller: controllerAppBar,
          crossAxisCount: orientation == Orientation.landscape ? 4 : 2,
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
      }),
    );
  }

  Card buildCard() {
>>>>>>> b0707cdd8e03c0386b98e1fb5545e62e3de663ea
    return Card(
      elevation: 10,
      shadowColor: Colors.grey[200],
      color: Colors.grey[200],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
<<<<<<< HEAD
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



=======
          Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  child: Image.asset(
                    'assets/images/home.jpg',
                    fit: BoxFit.cover,
                  ),
                  height: 160,
                  width: 300,
                ),
              ),
              Positioned(
                  right: 10,
                  child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.favorite,
                        color: Colors.green,
                      ))),
              Positioned(
                  left: 8,
                  child: IconButton(
                      onPressed: () {
                        var ad = AlertDialog(
                          title: const Text("Do you want to :"),
                          content: SizedBox(
                            height: 150,
                            child: Column(
                              children: [
                                const Divider(
                                  height: 10,
                                ),
                                Container(
                                  color: Colors.red,
                                  child: ListTile(
                                    leading: const Icon(
                                      Icons.delete,
                                      color: Colors.white,
                                    ),
                                    title: const Text("Delete this property"),
                                    onTap: () => AwesomeDialog(
                                      context: context,
                                      animType: AnimType.SCALE,
                                      dialogType: DialogType.QUESTION,
                                      title: 'ِDelete',
                                      desc:
                                          'Do you want to delete this property?',
                                      btnOkOnPress: () {
                                        setState(() {
                                          Navigator.of(context).pop();
                                        });
                                      },
                                    )..show(),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  color: Colors.green,
                                  child: ListTile(
                                      leading: const Icon(
                                        Icons.edit,
                                        color: Colors.white,
                                      ),
                                      title: const Text("Edit this property"),
                                      onTap: () => Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  AddOrEditProperty(
                                                    isEdit: true,
                                                    property:
                                                        Te.listProperty1[0],
                                                  )))),
                                ),
                              ],
                            ),
                          ),
                        );
                        showDialog(context: context, builder: (_) => ad);
                      },
                      icon: Icon(
                        Icons.more_vert,
                        color: Colors.white,
                      ))),
            ],
          ),
          const Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text(
              '${'1000\$ Home'}',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
          ),
          const Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text(
              '${'Syria,Damascus'}',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 7, right: 20),
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
>>>>>>> b0707cdd8e03c0386b98e1fb5545e62e3de663ea
        ],
      ),
    );
  }
}
