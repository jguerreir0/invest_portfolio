import 'package:flutter/material.dart';
import 'package:invest_portfolio/features/portfolio/portfolio.dart';
import 'package:invest_portfolio/features/portfolio/presentation/widgets/neobank/neo_performance_section.dart';

import 'neo_header_section.dart';
import 'neo_holdings_section.dart';

class NeoBody extends StatelessWidget {
  const NeoBody({super.key});

  @override
  Widget build(BuildContext context) {
    return PullToRefresh(
      child: ListView(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
        children: const [
          NeoHeaderSection(),
          SizedBox(height: 16),
          NeoPerformanceSection(),
          SizedBox(height: 8),
          NeoHoldingsSection(),
        ],
      ),
    );
  }
}
