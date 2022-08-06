
import 'package:flutter/material.dart';
import 'package:project_111/core/setting/setting.dart';
import 'package:project_111/features/properties/presentation/pages/search_user.dart';
import '../../features/authentication/presentation/pages/account_details.dart';
import '../../features/authentication/presentation/pages/page_view.dart';
import '../../features/authentication/presentation/pages/profile.dart';
import '../../features/authentication/presentation/pages/signup_screen.dart';
import '../../features/properties/presentation/pages/map_screen.dart';
import '../../features/authentication/presentation/pages/splash_screen.dart';
import '../../features/properties/presentation/pages/my_favorite.dart';
import '../widgets/bottom_navigation_bar.dart';
import '../../features/authentication/presentation/pages/welcome.dart';
import '../../features/authentication/presentation/pages/sign_in.dart';
import '../../features/properties/presentation/pages/add_or_update_property.dart';
import '../../features/properties/presentation/pages/MyListingScreen.dart';
Map<String, WidgetBuilder> routes() {
  return {
  "/":(context)=>const SplashScreen(),
    SearchUser.routeName:(context)=>const SearchUser(),
    Setting.routeName:(context)=>const Setting(),
    PagesView.routeName: (context) => const PagesView(),
    Welcome.routeName: (context) => const Welcome(),
    SingIn.routeName: (context) => const SingIn(),
    AccountDetails.routeName: (context) => const AccountDetails(),
    Profile.routeName: (context) =>  Profile(),
    SignUpScreen.routeName:(context)=>const SignUpScreen(),
    MyListingScreen.routeName:(context)=>const MyListingScreen(),
    MapScreen.routeName:(context)=> MapScreen(),
    SplashScreen.routeName:(context)=>const SplashScreen(),
    MyFavorite.routeName:(context)=>const MyFavorite(listProperty: null),
    AddOrUpdateProperty.routeName:(context)=> AddOrUpdateProperty(),
    NavigationBarHome.routeName:(context)=>const NavigationBarHome(),

  };
}
