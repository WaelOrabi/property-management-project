import 'package:flutter/material.dart';
import 'package:project_111/core/setting/theme/app_color/app_color_dark.dart';


ThemeData getThemeDataDark() => ThemeData(
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: AppColorDark.primarySwitch,
      secondary: AppColorDark.secondarySwitch,
    ),
    primaryColor: AppColorDark.primaryColor,
    backgroundColor: AppColorDark.backGroundColor,
    appBarTheme: const AppBarTheme(
      shadowColor: AppColorDark.secondarySwitch,
      textTheme: TextTheme(
        bodyText1: TextStyle(fontSize:25,color: Colors.green),
      ),
      elevation: 4.0,
      color: Colors.black,
      centerTitle: true,
    ),
    textTheme: const TextTheme(
        bodyText1: TextStyle(
      color: AppColorDark.colorText,
    ),

    bodyText2: TextStyle(
      color: AppColorDark.colorTextFormField,
    ),
    ),
    iconTheme: const IconThemeData(
      color: AppColorDark.iconColor,
    ),
    cardTheme:CardTheme(
      elevation: 10,
      color: Colors.grey[800],
    ) ,

    dialogTheme: const DialogTheme(
        backgroundColor: Colors.black54,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        contentTextStyle: TextStyle(color: Colors.white)
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: const TextStyle(color: AppColorDark.colorHintTextForm),
      labelStyle: const TextStyle(color: AppColorDark.colorLabelStyle),
      floatingLabelStyle: const TextStyle(color: AppColorDark.colorFloatingLabelStyle),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColorDark.colorBorder),
        borderRadius: BorderRadius.circular(50),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColorDark.colorBorder),
        borderRadius: BorderRadius.circular(50),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColorDark.colorBorder),
        borderRadius: BorderRadius.circular(50),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColorDark.colorBorder),
        borderRadius: BorderRadius.circular(50),
      ),
    ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedItemColor: Colors.green,
    unselectedItemColor: Colors.grey,
    backgroundColor: Colors.black,
  ),
);
