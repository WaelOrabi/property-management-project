import 'package:flutter/material.dart';
 AppBar buildAppBar(
      {required String namePage,
      required VoidCallback fun,
      Color color=Colors.white}) {
    return AppBar(
      toolbarHeight: 80,
      centerTitle: true,
      title: Builder(
        builder: (context) {
          return Text(
            namePage,
            style:  Theme.of(context).appBarTheme.textTheme!.bodyText1,
          );
        }
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

