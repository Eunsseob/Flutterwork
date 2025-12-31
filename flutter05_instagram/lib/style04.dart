import 'package:flutter/material.dart';

var theme = ThemeData(
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(backgroundColor: Colors.amber),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.lightBlue,
      foregroundColor: Colors.pink,
      textStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
    ),
  ),
  textTheme: TextTheme(
    bodyMedium: TextStyle(color: Colors.pink),
    bodyLarge: TextStyle(color: Colors.teal),
  ),
  iconTheme: IconThemeData(color: Colors.blue),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.grey,
    titleTextStyle: TextStyle(color: Colors.black, fontSize: 25),
  ),
);
