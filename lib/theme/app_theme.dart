// theme/app_theme.dart
import 'package:flutter/material.dart';

class AppTheme {
  // Light theme colors
  static const Color _primaryColorLight = Color(0xFF3498DB); // Bright Blue
  static const Color _accentColorLight = Color(0xFFF39C12); // Orange
  static const Color _backgroundColorLight = Color(0xFFF5F5F5); // Light Gray
  static const Color _textColorLight = Color(0xFF2C3E50); // Dark Blue-Gray
  static const Color _errorColorLight = Color(0xFFE74C3C); // Soft Red

  // Dark theme colors
  static const Color _primaryColorDark = Color(0xFF2980B9); // Darker Blue
  static const Color _accentColorDark = Color(0xFFD35400); // Darker Orange
  static const Color _backgroundColorDark = Color(0xFF1A1A1A); // Very Dark Gray
  static const Color _textColorDark = Color(0xFFECF0F1); // Off-White
  static const Color _errorColorDark = Color(0xFFC0392B); // Darker Red

  static ThemeData lightTheme = _createTheme(
    primaryColor: _primaryColorLight,
    accentColor: _accentColorLight,
    backgroundColor: _backgroundColorLight,
    textColor: _textColorLight,
    errorColor: _errorColorLight,
    brightness: Brightness.light,
  );

  static ThemeData darkTheme = _createTheme(
    primaryColor: _primaryColorDark,
    accentColor: _accentColorDark,
    backgroundColor: _backgroundColorDark,
    textColor: _textColorDark,
    errorColor: _errorColorDark,
    brightness: Brightness.dark,
  );

  static ThemeData _createTheme({
    required Color primaryColor,
    required Color accentColor,
    required Color backgroundColor,
    required Color textColor,
    required Color errorColor,
    required Brightness brightness,
  }) {
    return ThemeData(
      primaryColor: primaryColor,
      colorScheme: ColorScheme(
        primary: primaryColor,
        secondary: accentColor,
        surface: backgroundColor,
        error: errorColor,
        onPrimary: brightness == Brightness.light ? Colors.white : Colors.black,
        onSecondary:
            brightness == Brightness.light ? Colors.black : Colors.white,
        onSurface: textColor,
        onError: Colors.white,
        brightness: brightness,
      ),
      scaffoldBackgroundColor: backgroundColor,
      textTheme: TextTheme(
        titleLarge: TextStyle(color: textColor, fontWeight: FontWeight.bold),
        bodyMedium: TextStyle(color: textColor),
        titleMedium: TextStyle(color: textColor.withOpacity(0.8)),
      ),
      appBarTheme: AppBarTheme(
        color: primaryColor,
        elevation: 0,
        iconTheme: IconThemeData(
            color:
                brightness == Brightness.light ? Colors.white : Colors.black),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: accentColor,
        foregroundColor:
            brightness == Brightness.light ? Colors.white : Colors.black,
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: primaryColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: accentColor, width: 2),
        ),
        labelStyle: TextStyle(color: textColor.withOpacity(0.8)),
      ),
      cardTheme: CardTheme(
        color: brightness == Brightness.light
            ? Colors.white
            : const Color(0xFF2C2C2C),
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor:
              brightness == Brightness.light ? Colors.white : Colors.black,
          backgroundColor: accentColor,
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }
}
