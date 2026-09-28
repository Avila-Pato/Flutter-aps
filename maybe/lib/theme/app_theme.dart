import 'package:flutter/material.dart';

const Color _customColor = Color(0xFF000000);

const List<Color> _colorListThemes = [
  _customColor,
  Colors.red,
  Colors.green,
  Colors.blue,
  Colors.yellow,
  Colors.purple,
  Colors.orange,
];

class AppTheme {
  late final int selectedColor;

  AppTheme({required this.selectedColor})
    : assert(
        selectedColor >= 0,
        'selectedColor must be between 0 and ${_colorListThemes.length - 1}',
      );

  ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorListThemes[selectedColor],
      appBarTheme: const AppBarTheme(backgroundColor: _customColor),
      brightness: Brightness.dark,
    );
  }
}
