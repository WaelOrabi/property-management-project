import 'dart:ui';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:project_111/core/widgets/widget_appbar.dart';

class Admin extends StatefulWidget {
  static String routeName = 'Admin';
  const Admin({Key? key}) : super(key: key);
  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  List user = ['ahmad','Ayham','wael','Ali'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(
          namePage: "Users",
          fun: () => Navigator.of(context).pop(),
          color: Colors.white,
        ),
        body: buildBody()
    );
  }

  ListView buildBody() {
    return ListView.builder(
      itemCount:user.length,
      itemBuilder: (BuildContext context, index) {
        // Display the list item
        return Dismissible(
          key: UniqueKey(),
          direction: DismissDirection.endToStart,
          onDismissed: (_) {
            setState(() {
              user.removeAt(index);
            });
          },
          child:ListTile(
            leading:const CircleAvatar(
              radius: 35,
              backgroundImage: AssetImage('assets/images/facebook.jpg'),
            ),
            title: Text(user[index],style: TextStyle(
                color:Colors.black,
            ),),
            subtitle:const Text('Email'),
          ),
          background: Container(
            color: Colors.red,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            alignment: Alignment.centerRight,
            child: const Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }
}
