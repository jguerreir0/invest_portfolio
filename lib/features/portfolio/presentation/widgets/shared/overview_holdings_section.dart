import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invest_portfolio/features/portfolio/portfolio.dart';

class OverviewHoldingsSection extends StatelessWidget {
  const OverviewHoldingsSection({
    super.key,
    required this.builder,
  });

  final Widget Function(BuildContext context, List<Asset> assets) builder;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<PortfolioBloc, PortfolioState, List<Asset>>(
      selector: (state) => state is PortfolioLoaded ? state.overview.assets : const [],
      builder: (context, assets) {
        if (assets.isEmpty) return const SizedBox.shrink();

        return builder(context, assets);
      },
    );
  }
}
