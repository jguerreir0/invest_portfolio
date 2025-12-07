import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invest_portfolio/core/core.dart';
import 'package:invest_portfolio/features/portfolio/portfolio.dart';

class OverviewPortfolioView extends StatelessWidget {
  const OverviewPortfolioView({
    super.key,
    required this.bodyBuilder,
  });

  final Widget Function() bodyBuilder;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<PortfolioTheme>()!;

    return Container(
      decoration: BoxDecoration(gradient: theme.backgroundGradient),
      child: SafeArea(
        child: BlocBuilder<PortfolioBloc, PortfolioState>(
          buildWhen: (previous, current) => previous.runtimeType != current.runtimeType,
          builder: (context, state) {
            if (state is PortfolioInitial || state is PortfolioLoading) {
              return const Loading();
            }

            if (state is PortfolioError) {
              return Error(
                message: state.message,
                onRetry: () {
                  context.read<PortfolioBloc>().add(const PortfolioStarted());
                },
              );
            }

            if (state is PortfolioLoaded) {
              return bodyBuilder();
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
