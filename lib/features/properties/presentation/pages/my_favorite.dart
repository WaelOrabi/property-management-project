import 'package:flutter/material.dart';
import 'package:project_111/core/paramaters.dart';
import 'package:project_111/core/widgets/widget_appbar.dart';
import 'package:project_111/features/properties/presentation/widgets/myListing_myFavorite_homeScreen_widget/buildGridView.dart';

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
      appBar:buildAppBar(namePage: 'My Favorite', fun: ()=>Navigator.of(context).pop()),
      body: widget.listProperty!.isEmpty
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
    );
  }
}
