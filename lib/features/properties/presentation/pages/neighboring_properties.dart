import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:project_111/core/widgets/bottom_navigation_bar.dart';
import 'package:project_111/core/widgets/property.dart';
import 'package:project_111/core/widgets/widget_appbar.dart';
import 'package:project_111/features/properties/presentation/pages/property_listing_details.dart';

class NeighboringProperties extends StatefulWidget {
  const NeighboringProperties({Key? key, required this.listProperty})
      : super(key: key);
  final List<Property> listProperty;

  @override
  State<NeighboringProperties> createState() => _NeighboringPropertiesState();
}

class _NeighboringPropertiesState extends State<NeighboringProperties> {
  double? _ratingValue;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: buildAppBar(
          namePage: "Neighboring Properties",
          fun: ()=> Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>const NavigationBarHome())),
          ),
      body: widget.listProperty.isEmpty
          ? const Center(
              child: Text(
                "There are not any properties",
                style: TextStyle(fontSize: 20),
              ),
            )
          : gridView(context),
    ));
  }

  GridView gridView(BuildContext context) {
    return GridView.count(
        shrinkWrap: true,
        crossAxisCount: 2,
        primary: false,
        crossAxisSpacing: 0.0,
        mainAxisSpacing: 0.0,
        childAspectRatio: 0.8,
        children: List.generate(widget.listProperty.length, (int index) {
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
                            File(widget
                                .listProperty[index].image[0].modifiedPath),
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
                              icon: const Icon(
                                Icons.favorite,
                                color: Colors.green,
                              ))),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(
                      '${widget.listProperty[index].price} , ${widget.listProperty[index].category} ',
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(
                      '${widget.listProperty[index].address!.country}, ${widget.listProperty[index].address!.region}  ',
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
                      builder: (context) => PropertyListingDetails(
                            property: widget.listProperty[index],
                          )));
            },
          );
        }));
  }
}
