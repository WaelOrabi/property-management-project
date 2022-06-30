import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:project_111/features/authentication/presentation/pages/profile.dart';
import 'package:project_111/features/properties/presentation/pages/add_property.dart';
import 'package:project_111/features/properties/presentation/pages/element_category.dart';
import 'package:project_111/features/properties/presentation/pages/map_screen.dart';
import 'package:project_111/features/properties/presentation/pages/property_listing_details.dart';
import 'package:project_111/tests/tests.dart';
import 'package:scroll_app_bar/scroll_app_bar.dart';
import '../widgets/category/category_widget.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = 'HomeScreen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController controller = ScrollController();
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  double? _ratingValue;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        key: _key,
        drawer: Drawer(
            child: Profile(
          user: Te.user
        )),
        appBar: buildScrollAppBar(),
        body: _buildBody(context),
      ),
    );
  }

  ScrollAppBar buildScrollAppBar() {
    File? file=Te.user.image;
    return ScrollAppBar(
      controller: controller,
      elevation: 0,
      toolbarHeight: 70,
      backgroundColor: Colors.white,
      centerTitle: true,
      title: const Text(
        'Home',
        style: TextStyle(color: Colors.green, fontSize: 25),
      ),
      leading: GestureDetector(
        child:  Padding(
          padding:const EdgeInsets.only(top: 2, left: 15),
          child: CircleAvatar(
            backgroundImage:FileImage(file!),
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
            onPressed: () => Navigator.pushNamed(context, MapScreen.routeName),
            icon: const Icon(
              Icons.map,
              color: Colors.green,
            )),
      ],
    );
  }

  Widget _buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: SingleChildScrollView(
        controller: controller,
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
            _buildSingleChildScrollViewInHorizontal(context),
            const Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: Text(
                'All property',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            gridView(context),

          ],
        )   )

    );
  }

  GridView gridView(BuildContext context) {
    return GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            primary: false,
            crossAxisSpacing: 0.0,
            mainAxisSpacing: 0.0,
            childAspectRatio: 0.8,
            children:List.generate(Te.listProperty1.length, (int index){
              return GestureDetector(
                child: Card(
                  color: Colors.grey[200],
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Stack(
                        children: [
                          Align(
                            alignment: Alignment.topCenter,
                            child: Container(
                              child: Image.file(
                                File(Te.listProperty1[index].image[0].modifiedPath),
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
                                  icon:const Icon(
                                    Icons.favorite,
                                    color: Colors.green,
                                  ))),
                        ],
                      ),
                       Padding(
                        padding:const EdgeInsets.only(left: 8),
                        child: Text(
                          '${Te.listProperty1[index].price} , ${Te.listProperty1[index].category} ',
                          style:const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ),
                       Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Text(
                          '${Te.listProperty1[index].address!.country}, ${Te.listProperty1[index].address!.region}  ',
                          style: const TextStyle(
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
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PropertyListingDetails()));
                },
              );
            })
          );
  }

  SingleChildScrollView _buildSingleChildScrollViewInHorizontal(
      BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          buildGestureDetector(
            context: context,
            linkImage: "assets/images/buy.jpg",
            nameBtn: "Buy",
            fun: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>const ElementCategory(category: 'Buy',)));},
            height: 6,
            width: 2.3,
          ),
          const SizedBox(
            width: 6,
          ),
          buildGestureDetector(
            context: context,
            linkImage: "assets/images/rent.jpg",
            nameBtn: "Rent",
            fun: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>ElementCategory(category: 'Rent',)));},
            height: 6,
            width: 2.3,
          ),
          const SizedBox(
            width: 6,
          ),
          buildGestureDetector(
            context: context,
            linkImage: "assets/images/Investment.jpg",
            nameBtn: "Investment",
            fun: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>ElementCategory(category: 'Investment',)));},
            height: 6,
            width: 2.3,
          ),
        ],
      ),
    );
  }

}
