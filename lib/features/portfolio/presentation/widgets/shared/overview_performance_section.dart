import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invest_portfolio/features/portfolio/portfolio.dart';

class OverviewPerformanceSection extends StatelessWidget {
  const OverviewPerformanceSection({
    super.key,
    required this.builder,
  });

  final Widget Function(BuildContext context, List<TimeSeriesPoint>) builder;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<PortfolioBloc, PortfolioState, List<TimeSeriesPoint>>(
      selector: (state) => state is PortfolioLoaded ? state.timeSeries : const [],
      builder: (context, series) => builder(context, series),
    );
  }
}
