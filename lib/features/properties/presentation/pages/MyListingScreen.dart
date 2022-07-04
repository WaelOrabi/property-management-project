import 'package:flutter/material.dart';
import 'package:project_111/core/widgets/user.dart';
import 'package:project_111/core/widgets/widget_appbar.dart';
import 'package:project_111/features/properties/presentation/widgets/myListing_myFavorite_homeScreen_widget/buildGridView.dart';
import 'package:scroll_app_bar/scroll_app_bar.dart';

class MyListingScreen extends StatefulWidget {
  static String routeName = 'MyListingScreen';

  const MyListingScreen({Key? key, this.user}) : super(key: key);
  final User? user;

  @override
  State<MyListingScreen> createState() => _MyListingScreenState();
}

class _MyListingScreenState extends State<MyListingScreen> {
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(namePage: "My Listing", fun: ()=>Navigator.of(context).pop()),
      body: buildBody(context:context),
    );
  }

  OrientationBuilder buildBody({required BuildContext context}) {
    return OrientationBuilder(builder: (context, orientation) {
      return buildGridView(
          orientation: orientation,
          controller: scrollController,
          listProperty: widget.user!.listProperty, context:context,delete:true);
    });
  }


}