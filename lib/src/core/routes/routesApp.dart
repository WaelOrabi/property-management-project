import 'package:flutter/material.dart';
import 'package:project_111/src/features/presentation/pages/account_details.dart';
import 'package:project_111/src/features/presentation/pages/mylistings_screen/MyListingScreen.dart';
import 'package:project_111/src/features/presentation/pages/page_view.dart';
import 'package:project_111/src/features/presentation/pages/profile.dart';
import 'package:project_111/src/features/presentation/pages/signup_screen/signup_screen.dart';
import '../../features/presentation/pages/welcome.dart';
import 'package:project_111/src/features/presentation/pages/sign_in.dart';

Map<String, WidgetBuilder> routes() {
  return {
    "/":(context)=>const PagesView(),
    PagesView.routeName: (context) => const PagesView(),
    Welcome.routeName: (context) => const Welcome(),
    SingIn.routeName: (context) => const SingIn(),
    AccountDetails.routeName: (context) => const AccountDetails(),
    Profile.routeName: (context) => const Profile(),
    SignUpScreen.routeName:(context)=>const SignUpScreen(),
    MyListingScreen.routeName:(context)=>const MyListingScreen(),
  };
}
