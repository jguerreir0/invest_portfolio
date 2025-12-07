import 'package:flutter/material.dart';

class PortfolioTheme extends ThemeExtension<PortfolioTheme> {
  const PortfolioTheme({
    required this.backgroundGradient,
    required this.cardBackground,
    required this.positiveColor,
    required this.negativeColor,
    required this.accent,
    required this.cardRadius,
    required this.isNeoBank,
  });

  final Gradient? backgroundGradient;
  final Color cardBackground;
  final Color positiveColor;
  final Color negativeColor;
  final Color accent;
  final BorderRadius cardRadius;
  final bool isNeoBank;

  @override
  PortfolioTheme copyWith({
    Gradient? backgroundGradient,
    Color? cardBackground,
    Color? positiveColor,
    Color? negativeColor,
    Color? accent,
    BorderRadius? cardRadius,
    bool? isNeoBank,
  }) {
    return PortfolioTheme(
      backgroundGradient: backgroundGradient ?? this.backgroundGradient,
      cardBackground: cardBackground ?? this.cardBackground,
      positiveColor: positiveColor ?? this.positiveColor,
      negativeColor: negativeColor ?? this.negativeColor,
      accent: accent ?? this.accent,
      cardRadius: cardRadius ?? this.cardRadius,
      isNeoBank: isNeoBank ?? this.isNeoBank,
    );
  }

  @override
  PortfolioTheme lerp(
    ThemeExtension<PortfolioTheme>? other,
    double t,
  ) {
    if (other is! PortfolioTheme) return this;

    return PortfolioTheme(
      backgroundGradient: Gradient.lerp(
        backgroundGradient,
        other.backgroundGradient,
        t,
      ),
      cardBackground: Color.lerp(cardBackground, other.cardBackground, t)!,
      positiveColor: Color.lerp(positiveColor, other.positiveColor, t)!,
      negativeColor: Color.lerp(negativeColor, other.negativeColor, t)!,
      accent: Color.lerp(accent, other.accent, t)!,
      cardRadius: BorderRadius.lerp(cardRadius, other.cardRadius, t)!,
      isNeoBank: t < 0.5 ? isNeoBank : other.isNeoBank,
    );
  }

  Color get performanceCardBackground => cardBackground;

  Color get performanceGridColor => (isNeoBank ? Colors.white : Colors.black).withValues(alpha: 0.06);

  Color get performanceLineColor => accent;

  TextStyle get axisLabelStyle => TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w400,
        color: (isNeoBank ? Colors.white : Colors.black87).withValues(alpha: 0.7),
      );

  Color get tooltipBackgroundColor => isNeoBank ? const Color(0xFF020617) : Colors.white;

  TextStyle get tooltipTextStyle => TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: isNeoBank ? Colors.white : Colors.black87,
      );
}
