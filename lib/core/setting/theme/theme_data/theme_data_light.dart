import 'package:flutter/material.dart';
import 'package:project_111/core/setting/theme/app_color/app_color_light.dart';




ThemeData getThemeDataLight() => ThemeData(
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: AppColorLight.primarySwitch,
      secondary: AppColorLight.secondarySwitch,
    ),
    primaryColor: AppColorLight.primaryColor,
    backgroundColor: AppColorLight.backGroundColor,
    appBarTheme: const AppBarTheme(
      shadowColor: AppColorLight.secondarySwitch,
      elevation: 5.0,
      textTheme: TextTheme(
        bodyText1: TextStyle(fontSize:25,color: Colors.green),
      ),
      color: Colors.white,
      centerTitle: true,
    ),
    textTheme: const TextTheme(
        bodyText1: TextStyle(
      color: AppColorLight.colorText,
    ),
    bodyText2: TextStyle(
      color: AppColorLight.colorTextFormField,
    ),
    ),
    iconTheme:const IconThemeData(
      color: AppColorLight.iconColor,
    ),
    cardTheme:CardTheme(
      elevation: 10,
      color: Colors.grey[200],
    ) ,
    dialogTheme:const DialogTheme(
      backgroundColor: Colors.white,
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      contentTextStyle: TextStyle(color: Colors.black)
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: const TextStyle(color: AppColorLight.colorHintTextForm),
      labelStyle:const TextStyle(color: AppColorLight.colorLabelStyle) ,
      floatingLabelStyle: const TextStyle(color: AppColorLight.colorFloatingLabelStyle),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColorLight.colorBorder),
        borderRadius: BorderRadius.circular(50),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColorLight.colorBorder),
        borderRadius: BorderRadius.circular(50),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColorLight.colorBorder),
        borderRadius: BorderRadius.circular(50),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColorLight.colorBorder),
        borderRadius: BorderRadius.circular(50),
      ),
    ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedItemColor: Colors.green,
    unselectedItemColor: Colors.grey,
    backgroundColor: Colors.white,
  ),
);
