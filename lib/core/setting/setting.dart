import 'package:flutter/material.dart';
import 'package:project_111/main.dart';
import 'package:project_111/main.dart';
import 'package:project_111/main.dart';
import 'package:project_111/main.dart';

class Setting extends StatefulWidget {
  static const routeName = 'Setting';
  static bool theme=false;
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        leading: IconButton(onPressed:(){
          Navigator.of(context).pop();
        }, icon:  Icon(Icons.arrow_back_outlined,color: Theme.of(context).primaryColor,)),
        title: Text('Setting',
            style:  TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Column(
          children: [

            Container(
              color: Colors.grey[200],
              child: ListTile(
                selectedColor: Colors.grey.shade700,
                focusColor: Colors.red,
                subtitle: MyApp.theme?const Text('Dark Mode'):const Text('Light Mode'),
                leading:MyApp.theme? const Icon(Icons.bedtime_rounded,color:Colors.black): const Icon(Icons.bedtime_outlined,color:Colors.black ,) ,
                title:  const Text("Theme",style: TextStyle(fontSize: 15,color: Colors.black),),
                onTap: () {
                  setState(() {
                    MyApp.theme =!MyApp.theme;
                    print(MyApp.theme);
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
