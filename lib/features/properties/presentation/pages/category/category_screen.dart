import 'package:flutter/material.dart';
import '../../../../authentication/presentation/pages/profile.dart';
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
      backgroundColor: Colors.white,
      title:const Text("Category",style: TextStyle(fontSize: 25,color: Colors.green),),
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
        _buildGestureDetector(context:context,
            linkImage: "assets/images/buy.jpg",
            nameBtn: "Buy",
        fun: (){},
        ),
        const SizedBox(height: 10,),
        _buildGestureDetector(context:context,
            linkImage: "assets/images/rent.jpg",
            nameBtn: "Rent",
        fun: (){}
        ),
        const SizedBox(height: 10,),
        _buildGestureDetector(context:context,
            linkImage: "assets/images/Investment.jpg",
            nameBtn: "Investment",
        fun:(){}
        ),
      ],
    ),

    );
  }

  GestureDetector _buildGestureDetector({
    required BuildContext context,
    required String linkImage,
    required String nameBtn,
  required VoidCallback fun
  }) {
    return GestureDetector(
        child: Container(
          height: MediaQuery.of(context).size.height/4,
          width:MediaQuery.of(context).size.width ,
          decoration:BoxDecoration(
            image: DecorationImage(image: AssetImage(linkImage),
                fit: BoxFit.cover,colorFilter:const ColorFilter.mode(Colors.grey,
                    BlendMode.modulate),
            ),
            borderRadius: BorderRadius.circular(10)
            ),
          child: Center(child: Text(nameBtn,style:const TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),)),
        ),
      onTap: fun,
      );
  }
}
