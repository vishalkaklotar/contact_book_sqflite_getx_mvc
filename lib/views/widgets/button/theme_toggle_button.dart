import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeToggleButton extends StatelessWidget {
  const ThemeToggleButton({
    super.key,
    required this.onThemeChange,
    required this.darkMode,
  });

  final void Function() onThemeChange;
  final bool darkMode;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onThemeChange,
      child: Icon(
        darkMode ? Icons.light_mode : CupertinoIcons.moon_fill,
      ),
    );
  }
}
