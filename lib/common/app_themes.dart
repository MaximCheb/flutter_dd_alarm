import 'package:flutter/material.dart';

class AppTheme{
  static ThemeData classicTheme()=>
    ThemeData(
      splashColor: Colors.blueGrey,
      primaryColor: const Color(0x4F5b66),
     bottomAppBarColor: const Color(0x65737E),
     hoverColor: const Color(0x343D46),
     colorScheme: ColorScheme.light()
    );
  static ThemeData darkTheme()=>
      ThemeData(
        primaryColor: Colors.white70,
          colorScheme: ColorScheme.dark(
            background: Color.fromARGB(255, 119, 119, 119)
          )
      );
  static ThemeData blueGreyTheme()=>
      ThemeData(
          primaryColor: const Color(0x536878),
          colorScheme: const ColorScheme.dark(
              background: const Color.fromARGB(255, 119, 119, 119),
              primary: const Color(0x536878),
              secondary: const Color(0x536878),
              error: const Color(0x536878),
              onSurface: const Color(0x536878),
              brightness: Brightness.dark

          )
      );
}