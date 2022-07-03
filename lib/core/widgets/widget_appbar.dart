import 'package:flutter/material.dart';
 AppBar buildAppBar(
      {required String namePage,
      required VoidCallback fun,
      Color color=Colors.white}) {
    return AppBar(
      toolbarHeight: 80,
      centerTitle: true,
      backgroundColor: color,
      title: Text(
        namePage,
        style: const TextStyle(color: Colors.green, fontSize: 25),
      ),
      elevation: 0,
      leading: IconButton(
        onPressed: fun,
        icon: const Icon(
          Icons.arrow_back_ios,
          color: Colors.green,
        ),
      ),
    );
  }

