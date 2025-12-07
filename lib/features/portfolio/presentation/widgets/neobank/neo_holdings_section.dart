import 'package:flutter/material.dart';
import 'package:invest_portfolio/features/portfolio/portfolio.dart';

class NeoHoldingsSection extends StatelessWidget {
  const NeoHoldingsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return OverviewHoldingsSection(
      builder: (context, assets) => NeoHoldingsBody(assets: assets),
    );
  }
}
