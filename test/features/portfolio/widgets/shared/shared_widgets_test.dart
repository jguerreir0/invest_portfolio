import 'package:bloc_test/bloc_test.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:invest_portfolio/features/portfolio/portfolio.dart';

import '../../../../test_helpers.dart';

void main() {
  late PortfolioOverview overview;
  late List<Asset> assets;
  late List<TimeSeriesPoint> series;
  late MockPortfolioBloc bloc;

  setUp(() {
    assets = [
      const Asset(
        id: '1',
        symbol: 'AAPL',
        name: 'Apple Inc.',
        quantity: 1,
        currentPrice: 123.45,
        changePercent: 1.2,
        weight: 0.3,
      ),
    ];

    overview = PortfolioOverview(
      totalValue: 1000,
      dailyChangePercent: 2.5,
      assets: assets,
    );

    series = [
      TimeSeriesPoint(timestamp: DateTime(2024, 1, 1), value: 1000),
      TimeSeriesPoint(timestamp: DateTime(2024, 1, 2), value: 1010),
    ];

    bloc = MockPortfolioBloc();

    whenListen(
      bloc,
      Stream<PortfolioState>.fromIterable([
        const PortfolioInitial(),
        PortfolioLoaded(overview: overview, timeSeries: series),
      ]),
      initialState: const PortfolioInitial(),
    );
  });

  testWidgets('Error calls onRetry when clicking the button', (tester) async {
    var tapped = false;

    await pumpTest(
      tester: tester,
      child: Error(
        message: 'Ups',
        onRetry: () => tapped = true,
      ),
    );

    await tester.tap(find.text('Try again'));
    await tester.pump();

    expect(tapped, isTrue);
  });

  testWidgets('Loading shows CircularProgressIndicator', (tester) async {
    await pumpTest(
      tester: tester,
      child: const Loading(),
    );

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('OverviewHeaderSection uses overview from bloc', (tester) async {
    await pumpWithBloc<PortfolioBloc>(
      tester: tester,
      child: OverviewHeaderSection(
        builder: (context, o) => Text(
          'Total: ${o.totalValue}',
          textDirection: TextDirection.ltr,
        ),
      ),
      bloc: bloc,
    );
    expect(find.text('Total: 1000.0'), findsOneWidget);
  });

  testWidgets('OverviewHoldingsSection uses assets list', (tester) async {
    await pumpWithBloc<PortfolioBloc>(
      tester: tester,
      child: OverviewHoldingsSection(
        builder: (context, assets) => Text(
          'Assets: ${assets.length}',
          textDirection: TextDirection.ltr,
        ),
      ),
      bloc: bloc,
    );

    expect(find.text('Assets: 1'), findsOneWidget);
  });

  testWidgets('OverviewPerformanceSection passes timeSeries to builder', (tester) async {
    await pumpWithBloc<PortfolioBloc>(
      tester: tester,
      child: OverviewPerformanceSection(
        builder: (context, series) => Text(
          'Points: ${series.length}',
          textDirection: TextDirection.ltr,
        ),
      ),
      bloc: bloc,
    );

    expect(find.text('Points: 2'), findsOneWidget);
  });

  testWidgets('PerformanceCard shows empty state when data does not exist', (tester) async {
    await pumpTest(
      tester: tester,
      child: PerformanceCard(
        timeSeries: [],
      ),
    );

    expect(find.text('No performance data yet'), findsOneWidget);
  });

  testWidgets('PerformanceCard draws LineChart when data exists', (tester) async {
    await pumpTest(
      tester: tester,
      child: PerformanceCard(timeSeries: series),
    );

    expect(find.byType(LineChart), findsOneWidget);
  });
}
