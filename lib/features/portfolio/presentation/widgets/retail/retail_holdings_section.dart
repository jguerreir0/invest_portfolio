import 'package:flutter/material.dart';
import 'package:invest_portfolio/features/portfolio/portfolio.dart';

class RetailHoldingsSection extends StatelessWidget {
  const RetailHoldingsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OverviewHoldingsSection(
      builder: (context, assets) => RetailHoldingsCard(assets: assets),
    );
  }
}
