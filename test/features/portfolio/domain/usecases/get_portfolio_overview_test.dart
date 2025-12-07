import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:invest_portfolio/features/portfolio/portfolio.dart';

import '../../../../test_helpers.dart';

void main() {
  late MockPortfolioRepository repository;
  late GetPortfolioOverview usecase;

  const overview = PortfolioOverview(
    totalValue: 1000,
    dailyChangePercent: 1.5,
    assets: [],
  );

  setUp(() {
    repository = MockPortfolioRepository();
    usecase = GetPortfolioOverview(repository);

    when(() => repository.getOverview()).thenAnswer((_) async => overview);
  });

  test('delegates to repository.getOverview()', () async {
    final result = await usecase();
    expect(result, overview);

    verify(() => repository.getOverview()).called(1);
    verifyNoMoreInteractions(repository);
  });
}
