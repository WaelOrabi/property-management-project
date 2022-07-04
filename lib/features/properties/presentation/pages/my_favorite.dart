import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:project_111/core/widgets/property.dart';
import 'package:project_111/core/widgets/user.dart';
import 'package:project_111/features/properties/presentation/widgets/myListing_myFavorite_homeScreen_widget/buildCard.dart';
import 'package:project_111/features/properties/presentation/widgets/myListing_myFavorite_homeScreen_widget/buildGridView.dart';

import 'package:scroll_app_bar/scroll_app_bar.dart';
class MyFavorite extends StatefulWidget {
  const MyFavorite({Key? key,required this.listProperty}) : super(key: key);
  static String routeName = 'MyFavorite';
  final List<Property>? listProperty;
  @override
  State<MyFavorite> createState() => _MyFavoriteState();
}

class _MyFavoriteState extends State<MyFavorite> {
  final scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildScrollAppBar(context),
      body: buildBody(context:  context),
    );
  }



  ScrollAppBar _buildScrollAppBar(BuildContext context) {
    return ScrollAppBar(
      controller: scrollController,
      iconTheme: const IconThemeData(color: Color(0xFF444D68)),
      elevation: 1.0,
      backgroundColor: Colors.white,
      centerTitle: true,
      title: const Text(
        'My Favorite',
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
        onPressed: ()=>
            Navigator.of(context).pop(),
      ),
    );
  }


  OrientationBuilder buildBody({required BuildContext context}) {
    return OrientationBuilder(
        builder: (context, orientation) {
          return buildGridView(
              orientation: orientation,
              controller: scrollController,
              listProperty: widget.listProperty, context: context);
        }
    );
  }
}
