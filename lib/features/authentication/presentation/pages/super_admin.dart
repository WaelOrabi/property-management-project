import 'dart:ui';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:project_111/core/widgets/widget_appbar.dart';

class SuperAdmin extends StatefulWidget {
  static String routeName = 'SuperAdmin';
  const SuperAdmin({Key? key}) : super(key: key);
  @override
  State<SuperAdmin> createState() => _SuperAdminState();
}

class _SuperAdminState extends State<SuperAdmin> {
  List user = ['ahmad','Ayham','wael','Ali'];
bool isAdmin=false;
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
                       color: isAdmin==false?Colors.black:Colors.green
                     ),),
                     subtitle:const Text('Email'),
             trailing: IconButton(onPressed: ()=> AwesomeDialog(
                 context: context,
                 animType: AnimType.SCALE,
                 dialogType: DialogType.QUESTION,
                 title: 'ِAdmin',
                 desc: isAdmin==false?'Do you want to set the user as admin?':'Do you want to remove admin?',
                 btnOkOnPress: () {
                   setState(() {
                     isAdmin=!isAdmin;
                   });
                 },
               )..show(), icon:const Icon(Icons.more_vert)),
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
