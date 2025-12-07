import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:invest_portfolio/core/core.dart';
import 'package:invest_portfolio/features/portfolio/portfolio.dart';

class PerformanceCard extends StatelessWidget {
  const PerformanceCard({
    super.key,
    required this.timeSeries,
  });

  final List<TimeSeriesPoint> timeSeries;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<PortfolioTheme>()!;

    if (timeSeries.isEmpty) {
      return _buildEmptyState(theme);
    }

    final spots = List<FlSpot>.generate(
      timeSeries.length,
      (i) => FlSpot(i.toDouble(), timeSeries[i].value),
    );

    final values = timeSeries.map((e) => e.value);
    final minY = values.reduce((a, b) => a < b ? a : b);
    final maxY = values.reduce((a, b) => a > b ? a : b);

    // Padding for the chart
    final yPadding = (maxY - minY).abs() * 0.1;
    final chartMinY = minY - yPadding;
    final chartMaxY = maxY + yPadding;

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      color: theme.performanceCardBackground,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
        child: SizedBox(
          height: 200,
          child: LineChart(
            LineChartData(
              minX: spots.first.x,
              maxX: spots.last.x,
              minY: chartMinY,
              maxY: chartMaxY,
              gridData: FlGridData(
                show: true,
                drawVerticalLine: false,
                getDrawingHorizontalLine: (_) => FlLine(
                  color: theme.performanceGridColor,
                  strokeWidth: 0.5,
                ),
              ),
              titlesData: FlTitlesData(
                show: true,
                leftTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                topTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                rightTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                bottomTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
              ),
              borderData: FlBorderData(
                show: false,
              ),
              lineTouchData: LineTouchData(
                enabled: true,
                handleBuiltInTouches: true,
                touchTooltipData: LineTouchTooltipData(
                  tooltipBorderRadius: BorderRadius.all(Radius.circular(10)),
                  tooltipPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  getTooltipColor: (touchedSpot) => theme.tooltipBackgroundColor,
                  getTooltipItems: (touchedSpots) {
                    return touchedSpots.map((ts) {
                      final index = ts.x.toInt().clamp(0, timeSeries.length - 1);
                      final point = timeSeries[index];
                      return LineTooltipItem(
                        '€ ${point.value.toStringAsFixed(2)}',
                        theme.tooltipTextStyle,
                      );
                    }).toList();
                  },
                ),
              ),
              lineBarsData: [
                LineChartBarData(
                  spots: spots,
                  isCurved: true,
                  barWidth: 2,
                  color: theme.performanceLineColor,
                  dotData: FlDotData(show: false),
                  belowBarData: BarAreaData(
                    show: true,
                    color: theme.performanceLineColor.withValues(
                      alpha: theme.isNeoBank ? 0.25 : 0.12,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyState(PortfolioTheme theme) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      color: theme.performanceCardBackground,
      child: SizedBox(
        height: 160,
        child: Center(
          child: Text(
            'No performance data yet',
            style: theme.axisLabelStyle,
          ),
        ),
      ),
    );
  }
}
