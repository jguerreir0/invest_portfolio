import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:invest_portfolio/core/theme/app_theme.dart';
import 'package:invest_portfolio/core/theme/portfolio_theme.dart';

void main() {
  PortfolioTheme extensionFrom(ThemeData theme) => theme.extension<PortfolioTheme>()!;

  test('AppThemeData.retail exposes PortfolioTheme with isNeoBank = false', () {
    final theme = AppThemeData.retail();
    final ext = extensionFrom(theme);

    expect(ext.isNeoBank, isFalse);
    expect(ext.cardBackground, isNotNull);
    expect(ext.accent, isA<Color>());
  });

  test('AppThemeData.neo exposes PortfolioTheme with isNeoBank = true', () {
    final theme = AppThemeData.neo();
    final ext = extensionFrom(theme);

    expect(ext.isNeoBank, isTrue);
    expect(ext.backgroundGradient, isNotNull);
    expect(ext.accent, isA<Color>());
  });

  test('PortfolioTheme.lerp correctly mixes the properties', () {
    final a = PortfolioTheme(
      backgroundGradient: const LinearGradient(colors: [Colors.black, Colors.white]),
      cardBackground: Colors.red,
      positiveColor: Colors.green,
      negativeColor: Colors.red,
      accent: Colors.blue,
      cardRadius: BorderRadius.circular(8),
      isNeoBank: false,
    );

    final b = PortfolioTheme(
      backgroundGradient: const LinearGradient(colors: [Colors.white, Colors.black]),
      cardBackground: Colors.blue,
      positiveColor: Colors.greenAccent,
      negativeColor: Colors.redAccent,
      accent: Colors.purple,
      cardRadius: BorderRadius.circular(24),
      isNeoBank: true,
    );

    final mid = a.lerp(b, 0.5);

    expect(mid.cardBackground, isNot(equals(a.cardBackground)));
    expect(mid.cardBackground, isNot(equals(b.cardBackground)));
    expect(mid.isNeoBank, isTrue);
  });
}
