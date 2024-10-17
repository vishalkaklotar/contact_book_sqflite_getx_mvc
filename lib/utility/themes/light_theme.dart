import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData.light(useMaterial3: true).copyWith(
  scaffoldBackgroundColor: Colors.white,
  cardColor: const Color(0xFFFFF7F7),
  colorScheme: const ColorScheme.light(primary: Color(0xff141218)),
  iconTheme: const IconThemeData(color: Color(0xff141218)),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    surfaceTintColor: Colors.transparent,
    foregroundColor: Color(0xff141218),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    border: OutlineInputBorder(),
  ),
);
