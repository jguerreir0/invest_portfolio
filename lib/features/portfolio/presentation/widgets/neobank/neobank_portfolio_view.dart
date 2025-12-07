import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invest_portfolio/features/portfolio/portfolio.dart';
import 'neobank_body.dart';

class NeoBankPortfolioView extends StatelessWidget {
  const NeoBankPortfolioView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PerformanceRangeCubit(),
      child: OverviewPortfolioView(
        bodyBuilder: () => const NeoBody(),
      ),
    );
  }
}
