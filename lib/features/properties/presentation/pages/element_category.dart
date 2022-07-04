import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:project_111/core/widgets/property.dart';
import 'package:project_111/core/widgets/widget_appbar.dart';
import 'package:project_111/features/properties/presentation/pages/property_listing_details.dart';
import '../../../../core/widgets/bottom_navigation_bar.dart';
import '../../../../tests/tests.dart';
import '../widgets/myListing_myFavorite_homeScreen_widget/buildGridView.dart';

class ElementCategory extends StatefulWidget {
  const ElementCategory({Key? key,required this.category}) : super(key: key);
  final String category;

  @override
  State<ElementCategory> createState() => _ElementCategoryState();
}

class _ElementCategoryState extends State<ElementCategory> {
List<Property> list=[];
final scrollController = ScrollController();
  @override
  void initState() {
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
                  context, NavigationBarHome.routeName);},),

        body: list.isEmpty
            ? const Center(
          child: Text(
            "There are not any properties",
            style: TextStyle(fontSize: 20),
          ),
        )
            :  Padding(
          padding: const EdgeInsets.all(8.0),
          child: OrientationBuilder(
              builder: (context, orientation) {
                return buildGridView(
                    orientation: orientation,
                    controller: scrollController,
                    listProperty: list, context: context);
              }
          ),
        ),
      ),
    );
  }
}
