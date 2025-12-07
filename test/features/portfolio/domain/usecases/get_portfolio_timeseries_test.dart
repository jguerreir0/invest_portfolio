import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:invest_portfolio/features/portfolio/portfolio.dart';

import '../../../../test_helpers.dart';

void main() {
  late MockPortfolioRepository repository;
  late GetPortfolioTimeSeries usecase;

  final series = [
    TimeSeriesPoint(timestamp: DateTime(2024, 1, 1), value: 1000),
    TimeSeriesPoint(timestamp: DateTime(2024, 1, 2), value: 1100),
  ];

  setUp(() {
    repository = MockPortfolioRepository();
    usecase = GetPortfolioTimeSeries(repository);

    when(() => repository.getTimeSeries()).thenAnswer((_) async => series);
  });

  test('delegates to repository.getTimeSeries()', () async {
    final result = await usecase();
    expect(result, series);

    verify(() => repository.getTimeSeries()).called(1);
    verifyNoMoreInteractions(repository);
  });
}
