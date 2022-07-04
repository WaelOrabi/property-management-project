import 'package:flutter/material.dart';
import 'package:project_111/features/properties/presentation/widgets/myListing_myFavorite_homeScreen_widget/buildGridView.dart';
import '../../../../core/widgets/property.dart';

class ListPropertySearch extends StatefulWidget {
 final List<Property> ? listPropertySearch;
  const ListPropertySearch({Key? key,required this.listPropertySearch}) : super(key: key);

  @override
  State<ListPropertySearch> createState() => _ListPropertySearchState();
}

class _ListPropertySearchState extends State<ListPropertySearch> {
  ScrollController scrollController =ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: OrientationBuilder(builder: (context, orientation) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: IconButton(onPressed:(){
                      Navigator.of(context).pop();
                    }, icon: const Icon(Icons.arrow_back_outlined,color: Colors.green,)),
                  ),
                  const SizedBox(height: 40,),
                  buildBody(orientation,context),
                ],
              ),
            );}

          )),
    );
  }
   GridView buildBody(Orientation orientation,BuildContext context) {
    return buildGridView(
          orientation: orientation,
          controller: scrollController,
          listProperty: widget.listPropertySearch, context:context);
  }
}
