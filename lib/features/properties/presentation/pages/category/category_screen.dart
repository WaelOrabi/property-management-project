import 'package:flutter/material.dart';
import '../../../../authentication/presentation/pages/profile.dart';
import '../../widgets/category/category_widget.dart';
class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);
static String routeName='Category';
  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _key,
        drawer: const Drawer(child: Profile()),
        appBar: _buildAppBar(),
        body: _buildBody(context),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      centerTitle: true,
      toolbarHeight: 70,
      backgroundColor: Colors.white,
      title:const Text("Categories",style: TextStyle(fontSize: 25,color: Colors.green),),
      leading: GestureDetector(
        child: const Padding(
          padding: EdgeInsets.only(top: 2, left: 15),
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/images/home.jpg',),
            radius: 50,
          ),
        ),
          onTap: () => _key.currentState!.openDrawer(),
      ),

    );
  }

  Widget _buildBody(BuildContext context){
    return Padding(
      padding:const EdgeInsets.all(8),
    child: Column(

      children: [
        buildGestureDetector(
          context:context,
          linkImage: "assets/images/buy.jpg",
          nameBtn: "Buy",
          fun: (){},
          height:4,
          width: 1,
        ),
        const SizedBox(height:6,),
        buildGestureDetector(
          context:context,
          linkImage: "assets/images/rent.jpg",
          nameBtn: "Rent",
          fun: (){},
          height: 4,
          width:1,
        ),
        const SizedBox(height: 6,),
        buildGestureDetector(
          context:context,
          linkImage: "assets/images/Investment.jpg",
          nameBtn: "Investment",
          fun: (){},
          height: 4,
          width: 1,
        ),

      ],
    ),

    );
  }
}
