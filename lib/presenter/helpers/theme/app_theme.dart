import 'package:flutter/material.dart';

ThemeData appTheme() {
  final primaryColor = Color(0xff111821);
  final highlightColor = Color(0xff0582CA);
  final backgroundColor = Color(0xff111821);
  final textColor = Colors.white;
  final primaryDarkColor = Color(0xff0D1218);
  final textTheme = TextTheme(
    headline1: TextStyle(
      fontSize: 35,
      fontWeight: FontWeight.bold,
      color: highlightColor,
    ),
    headline2: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: textColor,
    ),
    headline3: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: textColor,
    ),
  );
  return ThemeData(
    primaryColor: primaryColor,
    highlightColor: highlightColor,
    textTheme: textTheme,
    backgroundColor: backgroundColor,
    primaryColorDark: primaryDarkColor,
    iconTheme: IconThemeData(color: textColor),
  );
}
