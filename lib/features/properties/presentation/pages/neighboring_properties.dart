import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:project_111/core/widgets/bottom_navigation_bar.dart';
import 'package:project_111/core/widgets/property.dart';
import 'package:project_111/core/widgets/widget_appbar.dart';
import 'package:project_111/features/properties/presentation/pages/property_listing_details.dart';

import '../widgets/myListing_myFavorite_homeScreen_widget/buildGridView.dart';

class NeighboringProperties extends StatefulWidget {
  const NeighboringProperties({Key? key, required this.listProperty})
      : super(key: key);
  final List<Property> listProperty;

  @override
  State<NeighboringProperties> createState() => _NeighboringPropertiesState();
}

class _NeighboringPropertiesState extends State<NeighboringProperties> {
  final scrollController = ScrollController();
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
          : Padding(
            padding: const EdgeInsets.all(8.0),
            child: OrientationBuilder(
            builder: (context, orientation) {
              return buildGridView(
                  orientation: orientation,
                  controller: scrollController,
                  listProperty: widget.listProperty, context: context);
            }
      ),
          ),
    ));
  }

}
