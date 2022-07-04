import 'package:flutter/material.dart';
import 'package:project_111/core/widgets/user.dart';
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
      appBar: buildScrollAppBar(context),
      body: buildBody(),
    );
  }

  OrientationBuilder buildBody() {
    return OrientationBuilder(builder: (context, orientation) {
      return buildGridView(
          orientation: orientation,
          controller: scrollController,
          listProperty: widget.user!.listProperty);
    });
  }

  ScrollAppBar buildScrollAppBar(BuildContext context) {
    return ScrollAppBar(
      controller: scrollController,
      iconTheme: const IconThemeData(color: Color(0xFF444D68)),
      elevation: 1.0,
      backgroundColor: Colors.white,
      centerTitle: true,
      title: const Text(
        'My Listings',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.green,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}