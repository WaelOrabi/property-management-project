import 'package:flutter/material.dart';
import '../../../domain/entities/property.dart';
import 'buildCard.dart';

GridView buildGridView(
    {required Orientation orientation,
    required ScrollController controller,
    required List<Property>? listProperty,
    required BuildContext context,
      bool delete=true,
    }) {
  return GridView.count(
    controller: controller,
    shrinkWrap: true,
    crossAxisCount: orientation == Orientation.landscape ? 3 : 2,
    crossAxisSpacing: 5.0,
    mainAxisSpacing: 5.0,
    childAspectRatio: orientation == Orientation.landscape ? 0.8 : 0.9,
    children: listProperty!.map((property) {
      return BuildCard(property: property, orientation: orientation,delete:delete);
    }).toList(),
  );
}
