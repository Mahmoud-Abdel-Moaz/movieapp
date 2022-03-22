import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors.dart';

/*  SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);*/
ThemeData lightTheme = ThemeData(
  appBarTheme: const AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: cultured,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
    ),
  ),
  primarySwatch: kPrimaryColor,
  //unselectedWidgetColor: Colors.white,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: defaultColor,
      elevation: 0.0,
      unselectedItemColor: Colors.grey,
      backgroundColor: Color(0xF9F9F9F0)), // <-- your color
);

const MaterialColor kPrimaryColor = MaterialColor(
  0xFFff7500,
  <int, Color>{
    50: Color(0xFF0E7AC7),
    100: Color(0xFF0E7AC7),
    300: Color(0xFF0E7AC7),
    400: Color(0xFF0E7AC7),
    500: Color(0xFF0E7AC7),
    600: Color(0xFF0E7AC7),
    700: Color(0xFF0E7AC7),
    800: Color(0xFF0E7AC7),
    900: Color(0xFF0E7AC7),
  },
);
