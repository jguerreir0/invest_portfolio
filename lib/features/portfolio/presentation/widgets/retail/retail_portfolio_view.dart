import 'package:flutter/material.dart';
import 'package:invest_portfolio/features/portfolio/portfolio.dart';

import 'retail_body.dart';

class RetailPortfolioView extends StatelessWidget {
  const RetailPortfolioView({super.key});

  @override
  Widget build(BuildContext context) {
    return OverviewPortfolioView(
      bodyBuilder: () => const RetailBody(),
    );
  }
}
