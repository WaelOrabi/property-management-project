
import 'package:flutter/material.dart';
import 'package:project_111/features/authentication/presentation/pages/account_details.dart';
import 'package:project_111/features/authentication/presentation/pages/page_view.dart';
import 'package:project_111/features/authentication/presentation/pages/profile.dart';
import 'package:project_111/features/authentication/presentation/pages/signup_screen.dart';
import 'package:project_111/features/authentication/presentation/pages/super_admin.dart';
import 'package:project_111/features/authentication/presentation/pages/update_peofile.dart';
import 'package:project_111/features/conversation/presntation/pages/conversations.dart';
import 'package:project_111/features/properties/presentation/pages/category/category_screen.dart';
import 'package:project_111/features/properties/presentation/pages/home_screen/home_screen.dart';
import 'package:project_111/features/conversation/presntation/pages/chat.dart';
import 'package:project_111/features/properties/presentation/pages/map_screen/map_screen.dart';
import 'package:project_111/features/authentication/presentation/pages/splash_screen.dart';
import 'package:project_111/features/properties/presentation/pages/real_estate_listing_details/property_listing_details.dart';
import 'package:project_111/features/properties/presentation/pages/my_favorite/my_favorite.dart';
import 'package:project_111/core/widgets/bottom_navigation_bar.dart';
import '../../features/authentication/presentation/pages/admin.dart';
import '../../features/authentication/presentation/pages/welcome.dart';
import 'package:project_111/features/authentication/presentation/pages/sign_in.dart';
import '../../features/properties/presentation/pages/add_property/add_property.dart';
import '../../features/properties/presentation/pages/mylistings_screen/MyListingScreen.dart';

Map<String, WidgetBuilder> routes() {
  return {
    "/":(context)=> const NavigationBarHome(),
    PagesView.routeName: (context) => const PagesView(),
    Welcome.routeName: (context) => const Welcome(),
    SingIn.routeName: (context) => const SingIn(),
    AccountDetails.routeName: (context) => const AccountDetails(),
    Profile.routeName: (context) => const Profile(),
    SignUpScreen.routeName:(context)=>const SignUpScreen(),
    MyListingScreen.routeName:(context)=>const MyListingScreen(),
    AddProperty.routeName:(context)=> const AddProperty(),
    MapScreen.routeName:(context)=>const MapScreen(),
    SplashScreen.routeName:(context)=>SplashScreen(),
    SuperAdmin.routeName:(context)=>const SuperAdmin(),
    PropertyListingDetails.routeName:(context)=>const PropertyListingDetails(),
    Chat.routeName:(context)=>const Chat(),
    MyFavorite.routeName:(context)=>const MyFavorite(),
    UpdateProfile.routeName:(context)=>const UpdateProfile(),
    HomeScreen.routeName:(context)=>const HomeScreen(),
    NavigationBarHome.routeName:(context)=>const NavigationBarHome(),
    CategoryScreen.routeName:(context)=>const CategoryScreen(),
    Conversations.routeName:(context)=>const Conversations(),
  };
}
