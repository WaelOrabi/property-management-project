import 'package:flutter/material.dart';
import 'package:project_111/core/setting/setting.dart';
import 'package:project_111/core/setting/theme/theme_data/theme_data_dark.dart';
import 'package:project_111/core/setting/theme/theme_data/theme_data_light.dart';
import 'core/routes/routesApp.dart';



void main() {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static bool theme=false;
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: getThemeDataLight(),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: routes(),
    );
  }
}
