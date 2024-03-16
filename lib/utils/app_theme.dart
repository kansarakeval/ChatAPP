import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  appBarTheme: const AppBarTheme(
    centerTitle: true,
    backgroundColor: Colors.white,
    titleTextStyle: TextStyle(color: Colors.black, fontSize: 25),
  ),
  brightness: Brightness.light,
  textTheme: const TextTheme(
    titleLarge: TextStyle(fontSize: 30,color: Colors.black),
    titleMedium: TextStyle(fontSize: 25,color: Colors.black),
    titleSmall: TextStyle(fontSize: 20,color: Colors.black),
  ),
);

ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  appBarTheme: const AppBarTheme(
    centerTitle: true,
    backgroundColor: Colors.black12,
    titleTextStyle: TextStyle(color: Colors.white, fontSize: 25),
  ),
  brightness: Brightness.dark,
  textTheme: const TextTheme(
    titleLarge: TextStyle(fontSize: 30,color: Colors.white),
    titleMedium: TextStyle(fontSize: 25,color: Colors.white),
    titleSmall: TextStyle(fontSize: 20,color: Colors.white),
  ),
);
