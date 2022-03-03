import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
    primaryColor: Color.fromARGB(255, 0, 0, 0),
    primaryColorDark: const Color(0xFF320E38),
    primaryColorLight: const Color(0xFFFEF3EE),
    scaffoldBackgroundColor: Colors.white,
    backgroundColor: const Color(0xFFF5F5F5),
    fontFamily: 'Poppins',
    textTheme: textTheme(),
  );
}

TextTheme textTheme() {
  return const TextTheme(
    headline1: TextStyle(
        color: Colors.black, fontWeight: FontWeight.bold, fontSize: 36),
    headline2: TextStyle(
        color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24),
    headline3: TextStyle(
        color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
    headline4: TextStyle(
        color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
    headline5: TextStyle(
        color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14),
    headline6: TextStyle(
        color: Colors.black, fontWeight: FontWeight.normal, fontSize: 14),
    bodyText1: TextStyle(
        color: Colors.black, fontWeight: FontWeight.normal, fontSize: 12),
    bodyText2: TextStyle(
        color: Colors.black, fontWeight: FontWeight.normal, fontSize: 10),
  );
}