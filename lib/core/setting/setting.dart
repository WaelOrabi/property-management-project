import 'package:flutter/material.dart';
import 'package:project_111/core/widgets/widget_appbar.dart';
import 'package:project_111/features/authentication/presentation/pages/change_password.dart';
import 'package:project_111/main.dart';
import 'package:project_111/main.dart';
import 'package:project_111/main.dart';
import 'package:project_111/main.dart';

import '../../features/authentication/presentation/widgets/profile/profile_widget.dart';

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
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: buildAppBar(namePage: "Setting", fun: (){
          Navigator.of(context).pop();
        },
          color:Theme.of(context).backgroundColor
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 40),
          child: ListView(
            children: [

              Container(

                color: Colors.grey[200],
                child:
                ListTile(
                  selectedColor: Colors.grey.shade700,

                  leading: const Icon(Icons.lock,color:Colors.black) ,
                  title:  const Text("Change password",style: TextStyle(fontSize: 15,color: Colors.black),),
                  onTap: ()  => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>const ChangePassword() ))),
                ),

              const SizedBox(height: 8,),

              Container(
                color: Colors.grey[200],
                child: ListTile(
                  selectedColor: Colors.grey.shade700,
                  focusColor: Colors.red,
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
      ),
    );
  }
}
