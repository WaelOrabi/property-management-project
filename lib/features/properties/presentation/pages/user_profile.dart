import 'package:flutter/material.dart';
import 'package:project_111/core/paramaters.dart';
import 'package:project_111/features/properties/presentation/widgets/myListing_myFavorite_homeScreen_widget/buildGridView.dart';
class UserProfile extends StatelessWidget {
  static const routeName='UserProfile';
  final User user;
   UserProfile({Key? key,required this.user}) : super(key: key);
 ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Theme.of(context).backgroundColor,
      appBar: buildAppBar(context),
      body: buildBody(context),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      leading: IconButton(onPressed:(){
        Navigator.of(context).pop();
      }, icon:const Icon(Icons.arrow_back_outlined,color: Colors.green,)),

    );
  }

  SingleChildScrollView buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 50,),
          CircleAvatar(
            backgroundImage: FileImage(user.image!,scale: 1),

            radius: 100,
          ),
          SizedBox(height: 30,),
           Row(mainAxisAlignment: MainAxisAlignment.center,children: [Text(user.firstName!+' '+user.lastName!,style: TextStyle(color:Theme.of(context).colorScheme.secondary,fontWeight: FontWeight.bold,fontSize: 20),)],),
          user.listProperty!.isEmpty
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
                      listProperty: user.listProperty, context: context);
                }
            ),
          ),
        ],
      ),
    );
  }
}
