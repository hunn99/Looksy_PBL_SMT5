import 'package:flutter/material.dart';

const MaterialColor neutralTheme = MaterialColor(
  0xFF1b1b1b,
  <int, Color>{
    50: Color(0xFFF6F6F6),
    100: Color(0xFFE7E7E7),
    200: Color(0xFFD1D1D1),
    300: Color(0xFFB0B0B0),
    400: Color(0xFF888888),
    500: Color(0xFF6D6D6D),
    600: Color(0xFF5D5D5D),
    700: Color(0xFF4F4F4F),
    800: Color(0xFF454545),
    900: Color(0xFF3D3D3D),
    950: Color(0xFF1b1b1b),
  },
);

const Color blackTheme = Color(0xFF1B1B1B);

const Color redTheme = Color(0xFFC8170D);

const Color greenTheme = Color(0xFF22973F);

const Color yellowTheme = Color(0xFFD19500);

final ThemeData theme = ThemeData(
  fontFamily: 'sf-pro-display',
  primarySwatch: neutralTheme,
  colorScheme: ColorScheme.fromSwatch(primarySwatch: neutralTheme).copyWith(
      inversePrimary: Colors.white,
      secondary: neutralTheme[400],
      surface: neutralTheme[50],
      onPrimary: Colors.white,
      onSecondary: Colors.white),
);
