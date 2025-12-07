import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invest_portfolio/core/core.dart';

import '../widgets/widgets.dart';

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeCubit = context.read<ThemeCubit>();
    final currentTheme = context.watch<ThemeCubit>().state;
    final isRetail = currentTheme == AppTheme.retailBank;

    return Scaffold(
      extendBodyBehindAppBar: !isRetail,
      appBar: AppBar(
        backgroundColor: isRetail ? Theme.of(context).appBarTheme.backgroundColor : Colors.transparent,
        title: Text(
          isRetail ? 'Portfolio overview' : 'Money in motion',
        ),
        centerTitle: false,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: SegmentedButton<AppTheme>(
              style: const ButtonStyle(
                visualDensity: VisualDensity.compact,
              ),
              showSelectedIcon: false,
              segments: const [
                ButtonSegment(
                  value: AppTheme.retailBank,
                  label: Text('Retail'),
                ),
                ButtonSegment(
                  value: AppTheme.neoBank,
                  label: Text('Neobank'),
                ),
              ],
              selected: {currentTheme},
              onSelectionChanged: (set) => themeCubit.setTheme(set.first),
            ),
          ),
        ],
      ),
      body: isRetail ? const RetailPortfolioView() : const NeoBankPortfolioView(),
    );
  }
}
