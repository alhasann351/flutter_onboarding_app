import 'package:flutter/material.dart';

class AppThemes {
  static themeData() => ThemeData(
    scaffoldBackgroundColor: const Color(0xFF212327),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white),
      bodyMedium: TextStyle(color: Colors.white),
      bodySmall: TextStyle(color: Colors.white),
    ),
  );
}
