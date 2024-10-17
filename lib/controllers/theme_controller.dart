import 'package:contact_book_sqflite_getx_mvc/utility/themes/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utility/themes/dark_theme.dart';

class ThemeController extends GetxController {
  // Define the initial theme mode
  final RxBool _isDarkMode = true.obs;

  bool get isDarkMode => _isDarkMode.value;

  ThemeData get themeData => _isDarkMode.value ? darkTheme : lightTheme;

  void toggleTheme() {
    _isDarkMode.value = !_isDarkMode.value;
  }
}
