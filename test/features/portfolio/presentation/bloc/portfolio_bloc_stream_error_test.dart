import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:invest_portfolio/features/portfolio/portfolio.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../test_helpers.dart';

void main() {
  test('PortfolioBloc emits PortfolioError when stream fails', () async {
    final getSeries = MockGetTimeSeries();
    final watchOverview = MockWatchOverview();

    when(() => getSeries()).thenAnswer((_) async => <TimeSeriesPoint>[]);
    when(() => watchOverview()).thenAnswer((_) => Stream<PortfolioOverview>.error(Exception('boom')));

    final bloc = PortfolioBloc(getTimeSeries: getSeries, watchOverview: watchOverview);

    bloc.add(const PortfolioStarted());

    await expectLater(
      bloc.stream,
      emitsThrough(isA<PortfolioError>()),
    );
  });
}
