import 'package:flutter/material.dart';

class WidgetsAppBar extends StatelessWidget {
  const WidgetsAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
static  AppBar buildAppBar({required String namePage,required VoidCallback fun,required Color color}) {
    return AppBar(
      toolbarHeight: 80,
      centerTitle: true,
      backgroundColor: color,
      title: Text(
        namePage,
        style:const TextStyle(color: Colors.green, fontSize: 25),
      ),
      elevation: 0,
      leading: IconButton(
        onPressed:fun,
        icon: const Icon(
          Icons.arrow_back_ios,
          color: Colors.green,
        ),
      ),
    );
  }


}
