import 'package:flutter/material.dart';

final ThemeData darkTheme = ThemeData.dark(useMaterial3: true).copyWith(
  scaffoldBackgroundColor: const Color(0xff141218),
  cardColor: const Color(0xff2e2a38),
  iconTheme: const IconThemeData(color: Color(0xFFEADBC8)),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xff141218),
    surfaceTintColor: Colors.transparent,
    foregroundColor: Color(0xFFEADBC8),
  ),
  colorScheme: const ColorScheme.dark(primary: Color(0xFFEADBC8)),
  inputDecorationTheme: const InputDecorationTheme(
    border: OutlineInputBorder(),
  ),
);
