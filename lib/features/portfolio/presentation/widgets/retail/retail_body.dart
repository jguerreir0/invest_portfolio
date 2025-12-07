import 'package:flutter/material.dart';
import 'package:invest_portfolio/features/portfolio/portfolio.dart';

import 'retail_header_section.dart';
import 'retail_holdings_section.dart';
import 'retail_performance_section.dart';

class RetailBody extends StatelessWidget {
  const RetailBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PullToRefresh(
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 16),
        children: const [
          RetailHeaderSection(),
          SizedBox(height: 16),
          RetailPerformanceSection(),
          SizedBox(height: 16),
          RetailHoldingsSection(),
          SizedBox(height: 24),
        ],
      ),
    );
  }
}
