
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_text_style.dart';

ThemeData getAppTheme() {
  return ThemeData(
    primaryColor: AppColors.primary,
    //scaffoldBackgroundColor
    scaffoldBackgroundColor: AppColors.white,

    //appBar Theme
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primary,
    ),

    //text theme
    textTheme: TextTheme(
      displayLarge: boldStyle(),
      displayMedium: regularStyle(),
    ),

    //button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          )),
    ),

    // text field
    inputDecorationTheme: InputDecorationTheme(

      // //enabled Border
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.grey,
        ),
      ),
      //
      // //focused Border
      focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.grey,
          )
      ),
      //
      // //error Border
      errorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.grey,
          )
      ),

      //hint text
      hintStyle: regularStyle(color: AppColors.grey, fontSize: 14),

      // filled: true,
      // fillColor: AppColors.backGroundTextField,
    ),

    // text button Style ..
    textButtonTheme: TextButtonThemeData(

      style: ButtonStyle(

        foregroundColor: MaterialStateProperty.all(
          AppColors.grey,
        ),
        textStyle: MaterialStateProperty.all(
          boldStyle(color: AppColors.white, fontSize: 14),
        ),
      ),
    ),
  );
}


ThemeData getAppDarkTheme(){
  return ThemeData(
    primaryColor: AppColors.primary,
    //scaffoldBackgroundColor
    scaffoldBackgroundColor: AppColors.black,

    //appBar Theme
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primary,
    ),

    //text theme
    textTheme: TextTheme(
      displayLarge: boldStyle(color: AppColors.white),
      displayMedium: regularStyle(),
    ),

    //button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          )),
    ),

    // text field
    inputDecorationTheme: InputDecorationTheme(

      // //enabled Border
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.grey,
        ),
      ),
      //
      // //focused Border
      focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.grey,
          )
      ),
      //
      // //error Border
      errorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.grey,
          )
      ),

      //hint text
      hintStyle: regularStyle(color: AppColors.grey, fontSize: 14),

      // filled: true,
      // fillColor: AppColors.backGroundTextField,
    ),

    // text button Style ..
    textButtonTheme: TextButtonThemeData(

      style: ButtonStyle(

        foregroundColor: MaterialStateProperty.all(
          AppColors.grey,
        ),
        textStyle: MaterialStateProperty.all(
          boldStyle(color: AppColors.white, fontSize: 14),
        ),
      ),
    ),
  );
}