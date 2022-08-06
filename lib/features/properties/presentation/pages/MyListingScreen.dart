import 'package:flutter/material.dart';
import '../../../../core/paramaters.dart';
import '../../../../core/widgets/widget_appbar.dart';
import '../widgets/myListing_myFavorite_homeScreen_widget/buildGridView.dart';

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
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: buildAppBar(namePage: "My Listing", fun: ()=>Navigator.of(context).pop()),
      body: widget.user!.listProperty!.isEmpty
          ? const Center(
           child: Text(
          "There are not any properties",
          style: TextStyle(fontSize: 20),
        ),
      )
          :  Padding(
            padding: const EdgeInsets.all(8.0),
           child: OrientationBuilder(builder: (context, orientation) {
          return buildGridView(
              orientation: orientation,
              controller: scrollController,
              listProperty: widget.user!.listProperty, context:context,delete:true);
        }),
      ),
    );
  }

}