import 'dart:ui';
import 'package:flutter/material.dart';

class Styles {
  static const String defaultFontRegular = 'Raleway';

  static ThemeData customTheme = ThemeData(
    fontFamily: defaultFontRegular,
    brightness: Brightness.light,
    primaryColor: Colors.white,
    backgroundColor: Colors.orange[50],
    textTheme: TextTheme(
      headline1: TextStyle(color: Colors.grey[700], fontSize: 96),
      headline2: TextStyle(color: Colors.grey[700], fontSize: 60),
      headline3: TextStyle(color: Colors.grey[700], fontSize: 48),
      headline4: TextStyle(color: Colors.grey[700], fontSize: 34),
      headline5: TextStyle(color: Colors.grey[700], fontSize: 24),
      headline6: TextStyle(color: Colors.grey[700], fontSize: 20),
      subtitle1: TextStyle(color: Colors.grey[700], fontSize: 16),
      subtitle2: TextStyle(color: Colors.grey[700], fontSize: 14),
      bodyText1: TextStyle(color: Colors.grey[700], fontSize: 16),
      bodyText2: TextStyle(color: Colors.grey[700], fontSize: 16),
      button: TextStyle(color: Colors.grey[700], fontSize: 14),
      caption: TextStyle(color: Colors.grey[700], fontSize: 12),
      overline: TextStyle(color: Colors.grey[700], fontSize: 10),
    ),
    buttonTheme: ButtonThemeData(
      textTheme: ButtonTextTheme.primary,
    ),
  );

  static TextStyle homeTitle = TextStyle(
    color: Colors.white,
    fontSize: 50,
    fontFamily: 'Satisfy',
  );

  static TextStyle recipeDetailsBody = TextStyle(
    height: 1.5,
  );
}
