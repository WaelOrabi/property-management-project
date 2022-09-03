import 'package:flutter/material.dart';
import 'package:project_111/core/setting/theme/theme_data/theme_data_dark.dart';
import 'package:project_111/core/setting/theme/theme_data/theme_data_light.dart';
import 'core/routes/routesApp.dart';
import 'package:firebase_core/firebase_core.dart';

Future <void> main() async {
WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
  options: FirebaseOptions(
    apiKey: "XXX",
    appId: "XXX",
    messagingSenderId: "XXX",
    projectId: "XXX",
  ),

);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static bool theme=false;
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:theme==true? getThemeDataDark():getThemeDataLight(),
debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: routes(),
    );
  }
}
