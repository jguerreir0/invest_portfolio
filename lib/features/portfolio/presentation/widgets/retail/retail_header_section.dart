import 'package:flutter/material.dart';
import 'package:invest_portfolio/features/portfolio/portfolio.dart';

class RetailHeaderSection extends StatelessWidget {
  const RetailHeaderSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OverviewHeaderSection(
      builder: (context, overview) {
        return RetailHeader(
          totalValue: overview.totalValue,
          dailyChangePercent: overview.dailyChangePercent,
        );
      },
    );
  }
}
