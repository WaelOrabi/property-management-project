import 'package:flutter/material.dart';
import 'package:project_111/core/widgets/property.dart';
import 'package:project_111/features/properties/presentation/widgets/myListing_myFavorite_homeScreen_widget/buildCard.dart';

GridView buildGridView(
    {required Orientation orientation,
    required ScrollController controller,
    required List<Property>? listProperty}) {
  return GridView.count(
    controller: controller,
    shrinkWrap: true,
    crossAxisCount: orientation == Orientation.landscape ? 2 : 2,
    crossAxisSpacing: 5.0,
    mainAxisSpacing: 5.0,
    childAspectRatio: orientation == Orientation.landscape ? 1.3 : 0.8,
    children: listProperty!.map((property) {
      return buildCard(property: property, orientation: orientation);
    }).toList(),
  );
}
