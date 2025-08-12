import 'package:flutter/material.dart';

class AppTheme {
  static const primaryColor = Color(0x000000ff);
  static const secondaryColor = Color(0xFF8B5CF6); // Roxo vibrante
  static const accentColor = Color(0xFF06B6D4); // Cyan vibrante
  static const surfaceColor = Color(0xFFF8FAFC); // Branco azulado
  static const backgroundColor = Color(0xFFFFFBFF); // Branco puro
  static const errorColor = Color(0xFFEF4444); // Vermelho vibrante
  static const successColor = Color(0xFF10B981); // Verde vibrante
  static const warningColor = Color(0xFFF59E0B); // Laranja vibrante

  AppTheme._();
  static ThemeData get lightTheme {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryColor,
        brightness: Brightness.light,
        primary: primaryColor,
        secondary: secondaryColor,
        tertiary: accentColor,
        surface: successColor,
        error: errorColor,
      ),
      scaffoldBackgroundColor: backgroundColor,
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryColor,

        brightness: Brightness.dark,
        primary: primaryColor,
        secondary: secondaryColor,
        tertiary: accentColor,
        surface: const Color(0xff1e293b),
      ),
      scaffoldBackgroundColor: Color(0xff0f172a),
    );
  }
}
