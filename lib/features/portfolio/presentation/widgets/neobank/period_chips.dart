import 'package:flutter/material.dart';
import 'package:invest_portfolio/core/core.dart';
import 'package:invest_portfolio/features/portfolio/portfolio.dart';

class PeriodChips extends StatelessWidget {
  const PeriodChips({
    super.key,
    required this.selected,
    required this.onSelected,
  });

  final PerformanceRange selected;
  final ValueChanged<PerformanceRange> onSelected;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final theme = Theme.of(context).extension<PortfolioTheme>()!;

    final items = <(String, PerformanceRange)>[
      ('1D', PerformanceRange.d1),
      ('1W', PerformanceRange.w1),
      ('1M', PerformanceRange.m1),
      ('3M', PerformanceRange.m3),
      ('1Y', PerformanceRange.y1),
    ];

    return SizedBox(
      height: 32,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final (label, range) = items[index];
          final isSelected = range == selected;

          return GestureDetector(
            onTap: () => onSelected(range),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: isSelected ? theme.accent : Colors.white.withValues(alpha: 0.06),
                borderRadius: BorderRadius.circular(999),
              ),
              child: Center(
                child: Text(
                  label,
                  style: textTheme.labelSmall?.copyWith(
                    color: isSelected ? Colors.black : Colors.white70,
                    fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
