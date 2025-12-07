import 'package:flutter/material.dart';
import 'package:invest_portfolio/core/core.dart';
import 'package:invest_portfolio/features/portfolio/portfolio.dart';

class NeoAssetTile extends StatelessWidget {
  const NeoAssetTile({
    super.key,
    required this.asset,
    required this.textTheme,
  });

  final Asset asset;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<PortfolioTheme>()!;
    final isPositive = asset.changePercent >= 0;

    return Container(
      decoration: BoxDecoration(
        color: theme.cardBackground,
        borderRadius: theme.cardRadius,
        border: Border.all(color: Colors.white10),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 10,
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                  theme.accent,
                  theme.accent.withValues(alpha: 0.2),
                ],
              ),
            ),
            child: Center(
              child: Text(
                asset.symbol.toUpperCase(),
                style: textTheme.labelSmall?.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  asset.name,
                  style: textTheme.bodyMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  '${asset.symbol} • ${(asset.weight * 100).toStringAsFixed(1)}%',
                  style: textTheme.labelSmall?.copyWith(
                    color: Colors.white54,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                formatCurrency(asset.currentPrice),
                style: textTheme.bodyMedium?.copyWith(
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 4),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    isPositive ? Icons.north_east : Icons.south_east,
                    size: 14,
                    color: isPositive ? theme.positiveColor : theme.negativeColor,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '${asset.changePercent.toStringAsFixed(2)}%',
                    style: textTheme.labelSmall?.copyWith(
                      color: isPositive ? theme.positiveColor : theme.negativeColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
