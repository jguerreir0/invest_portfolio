import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:invest_portfolio/core/theme/app_theme.dart';
import 'package:invest_portfolio/core/theme/portfolio_theme.dart';

void main() {
  group('PortfolioTheme', () {
    late PortfolioTheme retail;
    late PortfolioTheme neo;

    setUp(() {
      retail = AppThemeData.retail().extension<PortfolioTheme>()!;
      neo = AppThemeData.neo().extension<PortfolioTheme>()!;
    });

    test('copyWith changes only the specific fields', () {
      final copy = retail.copyWith(
        cardBackground: Colors.purple,
        isNeoBank: true,
      );

      expect(copy.cardBackground, Colors.purple);
      expect(copy.isNeoBank, isTrue);

      expect(copy.accent, retail.accent);
      expect(copy.cardRadius, retail.cardRadius);
    });

    test('lerp between retail e neo', () {
      final t0 = retail.lerp(neo, 0.0);
      final t1 = retail.lerp(neo, 1.0);
      final tm = retail.lerp(neo, 0.5);

      expect(t0.cardBackground, retail.cardBackground);
      expect(t1.cardBackground, neo.cardBackground);

      expect(tm.cardBackground, isNot(equals(retail.cardBackground)));
      expect(tm.cardBackground, isNot(equals(neo.cardBackground)));

      expect(t0.isNeoBank, retail.isNeoBank);
      expect(t1.isNeoBank, neo.isNeoBank);
      expect(tm.isNeoBank, neo.isNeoBank);
    });

    test('getters use the correct fields in mode retail', () {
      final t = retail;

      expect(t.performanceCardBackground, t.cardBackground);
      expect(t.performanceLineColor, t.accent);

      final expectedGrid = (Colors.black).withValues(alpha: 0.06);
      expect(t.performanceGridColor, expectedGrid);

      final axisStyle = t.axisLabelStyle;
      expect(axisStyle.color, (Colors.black87).withValues(alpha: 0.7));

      expect(t.tooltipBackgroundColor, Colors.white);
      expect(t.tooltipTextStyle.color, Colors.black87);
    });

    test('getters use the correct fields in mode neo', () {
      final t = neo;

      expect(t.performanceCardBackground, t.cardBackground);
      expect(t.performanceLineColor, t.accent);

      final expectedGrid = (Colors.white).withValues(alpha: 0.06);
      expect(t.performanceGridColor, expectedGrid);

      final axisStyle = t.axisLabelStyle;
      expect(axisStyle.color, (Colors.white).withValues(alpha: 0.7));

      expect(t.tooltipBackgroundColor, const Color(0xFF020617));
      expect(t.tooltipTextStyle.color, Colors.white);
    });
  });
}
