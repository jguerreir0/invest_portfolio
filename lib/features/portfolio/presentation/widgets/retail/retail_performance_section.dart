import 'package:flutter/material.dart';
import 'package:invest_portfolio/features/portfolio/portfolio.dart';

class RetailPerformanceSection extends StatelessWidget {
  const RetailPerformanceSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OverviewPerformanceSection(
      builder: (context, timeSeries) => PerformanceCard(timeSeries: timeSeries),
    );
  }
}
