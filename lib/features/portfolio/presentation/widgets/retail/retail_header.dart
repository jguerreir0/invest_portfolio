import 'package:flutter/material.dart';
import 'package:invest_portfolio/core/core.dart';

class RetailHeader extends StatelessWidget {
  const RetailHeader({
    super.key,
    required this.totalValue,
    required this.dailyChangePercent,
  });

  final double totalValue;
  final double dailyChangePercent;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<PortfolioTheme>()!;
    final isNegative = dailyChangePercent < 0;
    final changeColor = isNegative ? theme.negativeColor : theme.positiveColor;

    return Card(
      elevation: 0,
      color: theme.cardBackground,
      shape: RoundedRectangleBorder(
        borderRadius: theme.cardRadius,
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Total portfolio value',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.grey[600],
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              '€ ${totalValue.toStringAsFixed(2)}',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(
                  isNegative ? Icons.arrow_downward_rounded : Icons.arrow_upward_rounded,
                  size: 18,
                  color: changeColor,
                ),
                const SizedBox(width: 4),
                Text(
                  '${dailyChangePercent.toStringAsFixed(2)}% today',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: changeColor,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
