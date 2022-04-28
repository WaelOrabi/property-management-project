import 'package:flutter/material.dart';
import 'package:new_project/src/features/presentation/pages/account_details.dart';
import 'package:new_project/src/features/presentation/pages/page_view.dart';
import 'package:new_project/src/features/presentation/pages/profile.dart';
import '../../features/presentation/pages/welcome.dart';
import 'package:new_project/src/features/presentation/pages/sign_in.dart';

Map<String, WidgetBuilder> routes() {
  return {
    "/":(context)=>const PagesView(),
    PagesView.routeName: (context) => const PagesView(),
    Welcome.routeName: (context) => const Welcome(),
    SingIn.routeName: (context) => const SingIn(),
    AccountDetails.routeName: (context) => const AccountDetails(),
    Profile.routeName: (context) => const Profile(),
  };
}