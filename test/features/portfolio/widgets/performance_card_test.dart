import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:invest_portfolio/features/portfolio/portfolio.dart';

import '../../../test_helpers.dart';

void main() {
  testWidgets('shows empty state when data does not exist', (tester) async {
    await pumpTest(tester: tester, child: const PerformanceCard(timeSeries: []));

    expect(find.text('No performance data yet'), findsOneWidget);
  });

  testWidgets('renders LineChart when data exists', (tester) async {
    final series = [
      TimeSeriesPoint(timestamp: DateTime(2024, 1, 1), value: 1000),
      TimeSeriesPoint(timestamp: DateTime(2024, 1, 2), value: 1100),
      TimeSeriesPoint(timestamp: DateTime(2024, 1, 3), value: 900),
    ];

    await pumpTest(tester: tester, child: PerformanceCard(timeSeries: series));

    expect(find.byType(LineChart), findsOneWidget);
  });
}
