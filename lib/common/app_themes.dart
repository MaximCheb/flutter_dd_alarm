import 'package:flutter/material.dart';

class AppTheme{
  static ThemeData classicTheme()=>
    ThemeData(
      splashColor: Colors.blueGrey,
      primaryColor: const Color(0xffedf2f4),
     bottomAppBarColor: const Color(0xff65737E),
     hoverColor: const Color(0xff8d99ae),
     colorScheme: ColorScheme.light()
    );
  static ThemeData darkTheme()=>
      ThemeData(
        primaryColor: Colors.black12,
        hoverColor: Colors.white70,
          colorScheme: ColorScheme.dark(
            background: Color.fromARGB(255, 119, 119, 119)
          )
      );
      // from https://www.color-hex.com/color-palette/1407
  static ThemeData blueGrey()=>
      ThemeData(
          primaryColor: const Color(0xff6c757d),
          hoverColor: const Color(0xffcbf3f0),
          // https://material.io/design/color/the-color-system.html#color-theme-creation
          colorScheme: const ColorScheme.dark(
              primary: Color(0xffced4da),
              primaryContainer:  Color(0xffe9ecef),
              secondary: Color(0xff52796f),
              secondaryContainer: Color(0xff84a98c),
              //
              background: Color(0xff212529),
              surface:  Color(0xff343a40),
              error: Color(0xffd62828),
              //
              onPrimary: Color(0xfff7ede2),
              onSurface: Color(0xfff8f9fa),
              onBackground: Color(0xfff8f9fa),
              onError: Color(0xfff1faee),
              //
              brightness: Brightness.dark
          )
      );
      // from https://www.color-hex.com/color-palette/2738
      // from https://coolors.co/palettes/trending
      static ThemeData lightBlueTheme()=>
      ThemeData(
          primaryColor: const Color(0xff0077b6),
          hoverColor: const Color(0xff48cae4),
          // https://material.io/design/color/the-color-system.html#color-theme-creation
          colorScheme: const ColorScheme.light(
              primary: Color(0xff023e8a),
              primaryContainer:  Color(0xff03045e),
              secondary: Color(0xff00b4d8),
              secondaryContainer: Color(0xff0096c7),
              //
              background: Color(0xfff1faee),
              surface:  Color(0xffCAF0F8),
              error: Color(0xffef233c),
              //
              onPrimary: Color(0xfff7ede2),
              onSecondary: Color(0xffedf2f4),
              onSurface: Color(0xff2b2d42),
              onBackground: Color(0xff1d3557),
              onError: Color(0xfff1faee),
              //
              brightness: Brightness.light
          )
      );
      
}