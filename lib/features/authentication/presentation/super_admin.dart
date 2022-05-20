import 'package:flutter/material.dart';
import 'package:project_111/core/widgets/widget_appbar.dart';

class SuperAdmin extends StatefulWidget {
  static String routeName = 'SuperAdmin';
  const SuperAdmin({Key? key}) : super(key: key);

  @override
  State<SuperAdmin> createState() => _SuperAdminState();
}

class _SuperAdminState extends State<SuperAdmin> {
  List user = [];
  List<String> permissionItems = ['User', 'Admin'];
  String dropdownPermission = 'User';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetsAppBar.buildAppBar(
        namePage: "Super Admin",
        fun: () => Navigator.of(context).pop(),
        color: Colors.white,
      ),
      body: ListView.builder(
        itemCount:2 ,//user.length
        itemBuilder: (context, index) {
        return const ListTile(
                 leading: CircleAvatar(
                 radius: 30,
                   backgroundImage: AssetImage('assets/images/facebook.jpg'),
                 ),
                   title: Text('User name'),
                   subtitle: Text('Email user'),
                   );
            //   SizedBox(
            //     width: double.infinity/5,
            //     child: DropdownButton<String>(
            //       value: dropdownPermission,
            //       iconSize: 20,
            //       style: const TextStyle(color: Colors.black, fontSize: 16),
            //       underline: Container(),
            //       onChanged:(data)=>setState(() {
            //         dropdownPermission=data!;
            //       }),
            //       items: permissionItems.map<DropdownMenuItem<String>>((String value) {
            //         return DropdownMenuItem<String>(
            //           value: value,
            //           child: Text(value),
            //         );
            //       }).toList(),
            //     ),
            //   ),
            //
            // ],
        //);
      }),
    );
  }
}
