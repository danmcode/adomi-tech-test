import 'package:flutter/material.dart';

class AppTheme {
  static const Color adomiYellow = Color(0xFFFFea00);
  static const Color adomiGreen = Color(0xFF00c600);
  static const Color adomiGray = Color(0xFFafafaf);

  static ThemeData adomiTheme = ThemeData(
    //default font
    fontFamily: "poppins",

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      backgroundColor: adomiGreen,
      selectedIconTheme: IconThemeData(
        color: Colors.white,
      ),
      unselectedIconTheme: IconThemeData(
        color: Colors.white,
      ),
      selectedLabelStyle: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white,
    ),

    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: adomiYellow,
      elevation: 0,
    ),
  );
}
