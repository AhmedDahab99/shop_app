import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shop_app/shared/componnet/constants.dart';

ThemeData lightTheme = ThemeData(
  primarySwatch: Colors.deepPurple,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    titleSpacing: 20.0,
    backwardsCompatibility: false,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
    backgroundColor: Colors.white,
    elevation: 0,
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
  ),
  cardTheme: CardTheme(
    color: Color(0xfff9f6f7),
    elevation: 2,
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: blueBlackColor,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: blueBlackColor,
    unselectedItemColor: Colors.grey,
    elevation: 20.0,
    backgroundColor: Colors.white,
  ),
  textTheme: TextTheme(
    bodyText1: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: blueBlackColor,
    ),
    bodyText2: TextStyle(
      fontSize: 25.0,
      fontWeight: FontWeight.w600,
      color: blueBlackColor,
    ),
    headline3: TextStyle(
      fontSize: 36.0,
      fontWeight: FontWeight.w700,
      color: blueBlackColor,
    ),
    overline: TextStyle(
      fontSize: 16.0,
      color: blueBlackColor,
    ),
  ),
  fontFamily: 'Jannah'
);