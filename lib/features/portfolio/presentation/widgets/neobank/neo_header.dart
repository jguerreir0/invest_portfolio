import 'package:flutter/material.dart';
import 'package:invest_portfolio/core/core.dart';
import 'package:invest_portfolio/features/portfolio/portfolio.dart';

class NeoHeader extends StatelessWidget {
  const NeoHeader({
    super.key,
    required this.totalValue,
    required this.dailyChangePercent,
  });

  final double totalValue;
  final double dailyChangePercent;

  @override
  Widget build(BuildContext context) {
    final isPositive = dailyChangePercent >= 0;
    final changeAmount = totalValue * dailyChangePercent / 100;
    final formattedChangeAmount = formatCurrency(changeAmount.abs());
    final theme = Theme.of(context).extension<PortfolioTheme>()!;
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Balance',
          style: textTheme.labelMedium?.copyWith(
            color: Colors.white70,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          formatCurrency(totalValue),
          style: textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 6),
        Row(
          children: [
            Icon(
              isPositive ? Icons.trending_up_rounded : Icons.trending_down_rounded,
              size: 18,
              color: isPositive ? theme.positiveColor : theme.negativeColor,
            ),
            const SizedBox(width: 4),
            Text(
              '${dailyChangePercent.toStringAsFixed(2)}% today',
              style: textTheme.bodyMedium?.copyWith(
                color: isPositive ? theme.positiveColor : theme.negativeColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(width: 12),
            Text(
              '${isPositive ? '+' : '-'}$formattedChangeAmount',
              style: textTheme.bodySmall?.copyWith(
                color: Colors.white70,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
