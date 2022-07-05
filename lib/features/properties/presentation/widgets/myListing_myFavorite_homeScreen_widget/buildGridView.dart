import 'package:flutter/material.dart';
import 'package:project_111/core/paramaters.dart';
import 'package:project_111/features/properties/presentation/widgets/myListing_myFavorite_homeScreen_widget/buildCard.dart';

GridView buildGridView(
    {required Orientation orientation,
    required ScrollController controller,
    required List<Property>? listProperty,
    required BuildContext context,
      bool delete=false,
    }) {
  return GridView.count(
    controller: controller,
    shrinkWrap: true,
    crossAxisCount: orientation == Orientation.landscape ? 2 : 2,
    crossAxisSpacing: 5.0,
    mainAxisSpacing: 5.0,
    childAspectRatio: orientation == Orientation.landscape ? 1.4 : 0.9,
    children: listProperty!.map((property) {
      return BuildCard(property: property, orientation: orientation,delete:delete);
    }).toList(),
  );
}
