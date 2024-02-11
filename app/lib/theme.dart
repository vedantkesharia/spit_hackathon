import 'package:flutter/material.dart';
import 'constants.dart';

ThemeData buildThemeData() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    fontFamily: "OpenSans",
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: outlineInputBorder(),
      focusedBorder: outlineInputBorder(),
    ),
    appBarTheme: buildAppBarTheme(),
    textTheme: buildTextTheme(),
  );
}

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(30),
    borderSide: BorderSide(color: Colors.brown.shade600),
    gapPadding: 10,
  );
}

AppBarTheme buildAppBarTheme() {
  return AppBarTheme(
      elevation: 0,
      color: Colors.transparent,
      iconTheme: IconThemeData(
        color: Colors.black,
      ));
}

TextTheme buildTextTheme() {
  return TextTheme(
    bodyText1: TextStyle(color: kPrimarycolor),
    bodyText2: TextStyle(color: kPrimarycolor),
  );
}
