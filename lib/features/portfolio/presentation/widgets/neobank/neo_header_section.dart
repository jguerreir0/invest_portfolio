import 'package:flutter/material.dart';
import 'package:invest_portfolio/features/portfolio/portfolio.dart';

class NeoHeaderSection extends StatelessWidget {
  const NeoHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return OverviewHeaderSection(
      builder: (context, overview) {
        return NeoHeader(
          totalValue: overview.totalValue,
          dailyChangePercent: overview.dailyChangePercent,
        );
      },
    );
  }
}
