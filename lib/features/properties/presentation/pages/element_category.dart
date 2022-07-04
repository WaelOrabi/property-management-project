import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:project_111/core/widgets/property.dart';
import 'package:project_111/core/widgets/widget_appbar.dart';
import 'package:project_111/features/properties/presentation/pages/property_listing_details.dart';
import '../../../../core/widgets/bottom_navigation_bar.dart';
import '../../../../tests/tests.dart';

class ElementCategory extends StatefulWidget {
  const ElementCategory({Key? key,required this.category}) : super(key: key);
  final String category;

  @override
  State<ElementCategory> createState() => _ElementCategoryState();
}

class _ElementCategoryState extends State<ElementCategory> {
List<Property> list=[];
  double? _ratingValue;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for(int i=0;i<Te.listProperty1.length;i++){
if(Te.listProperty1[i].category==widget.category)
  {
    list.add(Te.listProperty1[i]);
  }
    }

  }
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        appBar: buildAppBar(
            namePage: widget.category,
            fun: () {
              Navigator.pushReplacementNamed(
                  context, NavigationBarHome.routeName);
            },
            color: Colors.white),

        body: _buildBody(context),

      ),
    );

  }

  Widget _buildBody(BuildContext context){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.count(
          shrinkWrap: true,
          crossAxisCount: 2,
          primary: false,
          crossAxisSpacing: 0.0,
          mainAxisSpacing: 0.0,
          childAspectRatio: 0.8,
          children:List.generate(list.length, (int index){
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
                              File(list[index].image[0].modifiedPath),
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
                        '${list[index].price} , ${list[index].category} ',
                        style:const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text(
                        '${list[index].address.country}, ${list[index].address.region}  ',
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
                        builder: (context) =>  PropertyListingDetails(property: Te.listProperty1[0],)));
              },
            );
          })
      ),
    );
  }

}
