import 'package:flutter/material.dart';
import 'portfolio_theme.dart';

enum AppTheme { retailBank, neoBank }

class AppThemeData {
  static ThemeData retail() {
    const primary = Color(0xFF0050B3);

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primary,
        brightness: Brightness.light,
      ),
      scaffoldBackgroundColor: const Color(0xFFF5F7FA),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Colors.black87,
        ),
      ),
      cardTheme: CardTheme(
        elevation: 0,
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      extensions: [
        PortfolioTheme(
          backgroundGradient: null,
          cardBackground: Colors.white,
          positiveColor: Colors.green.shade600,
          negativeColor: Colors.red.shade600,
          accent: primary,
          cardRadius: BorderRadius.circular(16),
          isNeoBank: false,
        ),
      ],
    );
  }

  static ThemeData neo() {
    const accent = Color(0xFF00FFC6);

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: ColorScheme.fromSeed(
        seedColor: accent,
        brightness: Brightness.dark,
      ),
      scaffoldBackgroundColor: const Color(0xFF050816),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
      cardTheme: const CardTheme(
        elevation: 0,
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      ),
      extensions: const [
        PortfolioTheme(
          isNeoBank: true,
          backgroundGradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF050816),
              Color(0xFF080C2A),
              Color(0xFF111827),
            ],
          ),
          cardBackground: Color(0x66121C33),
          positiveColor: Color(0xFF00FFC6),
          negativeColor: Color(0xFFFF4B81),
          accent: accent,
          cardRadius: BorderRadius.all(Radius.circular(22)),
        ),
      ],
    );
  }
}
