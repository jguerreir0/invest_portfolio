import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invest_portfolio/features/portfolio/portfolio.dart';

class OverviewHeaderSection extends StatelessWidget {
  const OverviewHeaderSection({
    super.key,
    required this.builder,
  });

  final Widget Function(BuildContext context, PortfolioOverview overview) builder;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<PortfolioBloc, PortfolioState, PortfolioOverview?>(
      selector: (state) => state is PortfolioLoaded ? state.overview : null,
      builder: (context, overview) {
        if (overview == null) return const SizedBox.shrink();

        return builder(context, overview);
      },
    );
  }
}
