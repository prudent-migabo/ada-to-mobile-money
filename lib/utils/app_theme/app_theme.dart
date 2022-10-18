import 'package:flutter/material.dart';

ThemeData lightTheme= ThemeData(
  colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: Color(0xff1e6eb3),
      secondary: Color(0xff1e6eb3),
      brightness: Brightness.light,
  ) ,
  inputDecorationTheme: InputDecorationTheme(
    focusedBorder: OutlineInputBorder(
     // borderRadius: BorderRadius.circular(10.0),
      borderSide: BorderSide(
        color: Color(0xff1e6eb3),
        width: 1,
        style: BorderStyle.solid,
      ),
    ),
    labelStyle: TextStyle(color: Colors.black,
        fontSize: 14.0),
    fillColor: Colors.grey[200],
    filled: true,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5.0),
      borderSide: BorderSide.none,
    ),
   // contentPadding: EdgeInsets.only(top: 10, bottom: 10, left: 10),
      contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
    hintStyle: TextStyle(color: Colors.black26),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      onPrimary: Colors.white,
    ),
  ),
);