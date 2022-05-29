import 'dart:async';
import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:project_111/features/authentication/presentation/pages/page_view.dart';
import 'package:project_111/features/authentication/presentation/pages/profile.dart';
import 'package:project_111/features/properties/presentation/pages/add_property/add_property.dart';


class SplashScreen extends StatefulWidget {
  static String routeName = 'SplashScreen';

  SplashScreen({Key? key}) : super(key: key);

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late Animation<double> logoAnimation;
  late AnimationController controller;


  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: Duration(seconds: 3), vsync: this);

    logoAnimation = Tween<double>(begin: 0, end: 1).animate(controller)
      ..addListener(() {
        setState(() {});
      });
    controller.forward();

    Timer(Duration(seconds: 5), () {
      Navigator.pushNamed(context,PagesView.routeName);
    });
  }
  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Image in the middle
          Center(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Opacity(
                opacity: logoAnimation.value,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/logo_app_property1.png',fit: BoxFit.fitHeight,),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}



