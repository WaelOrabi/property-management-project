import 'package:flutter/material.dart';
import 'package:project_111/src/features/presentation/pages/mylistings_screen/MyListingScreen.dart';
import 'package:project_111/src/features/presentation/pages/signup_screen/signup_screen.dart';
void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);

   static const int _bluePrimaryValue = 0x79e963;
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme:ThemeData(
        primarySwatch:Colors.green,
        primaryColor: Colors.green,
      ),
      debugShowCheckedModeBanner: false,
      home: SignUpScreen(),
    );
  }
}
