import 'package:flutter/material.dart';


import '../../features/account/presentation/pages/profile.dart';
import '../../features/account/presentation/pages/sign_in.dart';
import '../../features/account/presentation/pages/welcome.dart';
import '../../features/profile/account_details/presentation/pages/account_details.dart';

Map<String, WidgetBuilder> routes() {
  return {
    "/": (context) => const WelcomeScreen(),
    WelcomeScreen.routeName: (context) => const WelcomeScreen(),
    SignInScreen.routeName: (context) => const SignInScreen(),
    AccountDetails.routeName: (context) => const AccountDetails(),
    Profile.routeName: (context) => const Profile(),
  };
}
