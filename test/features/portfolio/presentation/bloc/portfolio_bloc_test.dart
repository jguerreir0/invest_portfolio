import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:invest_portfolio/features/portfolio/portfolio.dart';

import '../../../../test_helpers.dart';

void main() {
  late MockGetTimeSeries getTimeSeries;
  late MockWatchOverview watchOverview;

  setUp(() {
    getTimeSeries = MockGetTimeSeries();
    watchOverview = MockWatchOverview();
  });

  const overview = PortfolioOverview(
    totalValue: 2000,
    dailyChangePercent: 3.5,
    assets: [],
  );

  final series = [
    TimeSeriesPoint(timestamp: DateTime(2024, 1, 1), value: 1500),
    TimeSeriesPoint(timestamp: DateTime(2024, 1, 2), value: 1600),
  ];

  blocTest<PortfolioBloc, PortfolioState>(
    'emits [Loading, Loaded] when everything works',
    setUp: () {
      when(() => getTimeSeries()).thenAnswer((_) async => series);
      when(() => watchOverview()).thenAnswer((_) => Stream.value(overview));
    },
    build: () => PortfolioBloc(getTimeSeries: getTimeSeries, watchOverview: watchOverview),
    act: (bloc) => bloc.add(const PortfolioStarted()),
    expect: () => [
      const PortfolioLoading(),
      isA<PortfolioLoaded>()
          .having((s) => s.overview.totalValue, 'totalValue', overview.totalValue)
          .having((s) => s.timeSeries.length, 'timeSeries length', greaterThan(series.length)),
    ],
    verify: (_) {
      verify(() => getTimeSeries()).called(1);
      verify(() => watchOverview()).called(1);
    },
  );

  blocTest<PortfolioBloc, PortfolioState>(
    'emits Error when getTimeSeries throws exception',
    setUp: () {
      when(() => getTimeSeries()).thenThrow(Exception('boom'));
      when(() => watchOverview()).thenAnswer((_) => const Stream.empty());
    },
    build: () => PortfolioBloc(getTimeSeries: getTimeSeries, watchOverview: watchOverview),
    act: (bloc) => bloc.add(const PortfolioStarted()),
    expect: () => [
      const PortfolioLoading(),
      const PortfolioError('Failed to load portfolio data.'),
    ],
  );
}
