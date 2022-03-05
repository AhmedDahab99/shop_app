import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shop_app/shared/componnet/constants.dart';

ThemeData darkTheme = ThemeData(
    primarySwatch: Colors.deepOrange,
    scaffoldBackgroundColor: Color(0xff132c33),
    appBarTheme: AppBarTheme(
      titleSpacing: 20.0,
      backwardsCompatibility: false,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Color(0xff132c33),
        statusBarIconBrightness: Brightness.light,
      ),
      backgroundColor: Color(0xff132c33),
      elevation: 0,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    cardTheme: CardTheme(
      color: Color(0xff126e82),
      elevation: 2,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor:primaryColor,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.white,
      unselectedItemColor: primaryColor,
      elevation: 20.0,
      backgroundColor: Color(0xff132c33),
    ),
    textTheme: TextTheme(
      bodyText1: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      caption: TextStyle(
        fontSize: 12.0,
        fontWeight: FontWeight.w600,
        color: Colors.grey,
      ),
    ),
    primaryTextTheme:TextTheme(
      bodyText1: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
    ),
    fontFamily: 'Jannah'

);