import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invest_portfolio/features/portfolio/portfolio.dart';

class NeoPerformanceSection extends StatelessWidget {
  const NeoPerformanceSection({super.key});

  List<TimeSeriesPoint> _applyRange(
    List<TimeSeriesPoint> series,
    PerformanceRange range,
  ) {
    if (series.isEmpty) return series;

    int take;
    switch (range) {
      case PerformanceRange.d1:
        take = 10;
        break;
      case PerformanceRange.w1:
        take = 30;
        break;
      case PerformanceRange.m1:
        take = 60;
        break;
      case PerformanceRange.m3:
        take = 120;
        break;
      case PerformanceRange.y1:
        take = series.length;
        break;
    }

    if (series.length <= take) return series;
    return series.sublist(series.length - take);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PerformanceRangeCubit, PerformanceRange>(
      builder: (context, range) {
        return OverviewPerformanceSection(
          builder: (context, timeSeries) {
            final filtered = _applyRange(timeSeries, range);

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PeriodChips(
                  selected: range,
                  onSelected: (newRange) {
                    context.read<PerformanceRangeCubit>().setRange(newRange);
                  },
                ),
                const SizedBox(height: 16),
                PerformanceCard(
                  timeSeries: filtered,
                ),
              ],
            );
          },
        );
      },
    );
  }
}
