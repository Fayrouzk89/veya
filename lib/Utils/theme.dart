import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'style.dart';



ThemeData lightTheme = ThemeData.light().copyWith(
  colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: orangeColor,

      onPrimary: blackColor,
      secondary: orangeColor,
      background: Colors.white,
      brightness: Brightness.light,
      surfaceTint: Colors.transparent
  ),
  brightness: Brightness.light,

  useMaterial3: true,
  tabBarTheme: TabBarTheme(
    labelColor: primaryColor, // Selected tab text color
    unselectedLabelColor: Colors.black, // Unselected tab text color
    indicator: BoxDecoration(
      borderRadius: BorderRadius.circular(25.0), // Rounded corners
      color: primaryColor, // Background for selected tab
    ),
  ),
  cardColor: Colors.white,
  cardTheme: CardTheme(color: Colors.white,),
  dialogBackgroundColor: Colors.white,

  dialogTheme: DialogTheme(backgroundColor: Colors.white,),
  appBarTheme:  AppBarTheme(
      elevation: 0,

      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: primaryColor,
      ),
      backgroundColor: primaryColor
  ),
  scaffoldBackgroundColor: whiteColor,
  textTheme: textTheme.apply(
    bodyColor: blackColor,
    decorationColor: blackColor,
    displayColor: blackColor,
  ),
  listTileTheme: const ListTileThemeData(
    tileColor: whiteColor,
  ),

  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderSide: BorderSide(color: blackColor),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: orangeColor),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: blackColor),
    ),
    hintStyle: const TextStyle(
      fontFamily: sofia,
      fontSize: 16,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.5,
    ),
  ),
  // switchTheme: SwitchThemeData(
  //   thumbColor: MaterialStateProperty.all(orangeColor80),
  //   trackColor: MaterialStateProperty.all(orangeColor50),
  //   overlayColor: MaterialStateProperty.all(grayColor),
  // ),
);

ThemeData darkTheme = ThemeData.dark().copyWith(
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: blackColor,
    onPrimary: whiteColor,
    // secondary: orangeColor,
  ),
  useMaterial3: true,
  tabBarTheme: TabBarTheme(
    labelColor: primaryColor, // Selected tab text color
    unselectedLabelColor: Colors.black, // Unselected tab text color
    indicator: BoxDecoration(
      borderRadius: BorderRadius.circular(25.0), // Rounded corners
      color: primaryColor, // Background for selected tab
    ),
  ),
  appBarTheme:  AppBarTheme(
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: primaryColor,
      ),
      backgroundColor: primaryColor
  ),
  scaffoldBackgroundColor: blackColor,
  textTheme: textTheme.apply(
    bodyColor: whiteColor,
    decorationColor: whiteColor,
    displayColor: whiteColor,
  ),
  listTileTheme: ListTileThemeData(
    tileColor: blackColor,
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderSide: BorderSide(color: blackColor),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: orangeColor),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: blackColor),
    ),
    hintStyle: const TextStyle(
      fontFamily: sofia,
      fontSize: 16,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.5,
    ),
  ),
  switchTheme: SwitchThemeData(
    thumbColor: MaterialStateProperty.all(Colors.blue[800]),
    trackColor: MaterialStateProperty.all(Colors.blue[800]),
    overlayColor: MaterialStateProperty.all(grayColor),
  ),
);