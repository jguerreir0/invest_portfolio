import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:invest_portfolio/features/portfolio/portfolio.dart';

import '../../../../test_helpers.dart';

void main() {
  late MockPortfolioRepository repository;
  late WatchPortfolioOverview usecase;

  setUp(() {
    repository = MockPortfolioRepository();
    usecase = WatchPortfolioOverview(repository);
  });

  test('delegates to repository.watchOverview()', () async {
    const overview = PortfolioOverview(
      totalValue: 1234,
      dailyChangePercent: 2.5,
      assets: [],
    );

    final controller = StreamController<PortfolioOverview>();
    when(() => repository.watchOverview()).thenAnswer((_) => controller.stream);

    final stream = usecase();

    controller.add(overview);
    await expectLater(stream, emits(overview));

    await controller.close();
    verify(() => repository.watchOverview()).called(1);
    verifyNoMoreInteractions(repository);
  });
}
