import 'dart:io';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:project_111/core/widgets/user.dart';
import 'package:project_111/core/widgets/widget_appbar.dart';
import 'package:project_111/tests/tests.dart';

class SuperAdmin extends StatefulWidget {
  static String routeName = 'SuperAdmin';
  final User? user;

  const SuperAdmin({Key? key, this.user}) : super(key: key);

  @override
  State<SuperAdmin> createState() => _SuperAdminState();
}

class _SuperAdminState extends State<SuperAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(
          namePage: "Users",
          fun: () => Navigator.of(context).pop(),
          color: Colors.white,
        ),
        body: buildBody());
  }

  ListView buildBody() {
    return ListView.builder(
      itemCount: Te.listUser1.length,
      itemBuilder: (BuildContext context, index) {
        // Display the list item
        File? file = Te.listUser1[index].image;
        return Dismissible(
          key: UniqueKey(),
          direction: DismissDirection.endToStart,
          onDismissed: (_) {
            setState(() {
              Te.listUser1.removeAt(index);
            });
          },
          child: ListTile(
            leading: CircleAvatar(
              radius: 35,
              backgroundImage: FileImage(file!),
            ),
            title: Text(
              '${Te.listUser1[index].firstName} ${Te.listUser1[index].lastName}',
              style: TextStyle(
                  color: Te.listUser1[index].isSuperAdmin == true
                      ? Colors.blue
                      : Te.listUser1[index].isAdmin == false
                          ? Colors.black
                          : Colors.green),
            ),
            subtitle: Text('${Te.listUser1[index].email}'),
            trailing: IconButton(
                onPressed: () => AwesomeDialog(
                      context: context,
                      animType: AnimType.SCALE,
                      dialogType: DialogType.QUESTION,
                      title: 'ِAdmin',
                      desc: Te.listUser1[index].isAdmin == false
                          ? 'Do you want to set the user as admin?'
                          : 'Do you want to remove admin?',
                      btnOkOnPress: () {
                        setState(() {
                          Te.listUser1[index].isAdmin == true
                              ? Te.listUser1[index].isAdmin = false
                              : Te.listUser1[index].isAdmin = true;
                        });
                      },
                    )..show(),
                icon: const Icon(Icons.more_vert)),
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
