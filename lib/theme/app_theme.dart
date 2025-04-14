import 'package:flutter/material.dart';

class AppTheme {
  static final dark = ThemeData.dark(useMaterial3: true).copyWith(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown),
  );
  static final light = ThemeData.light(useMaterial3: true).copyWith(
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown),
  );
}
