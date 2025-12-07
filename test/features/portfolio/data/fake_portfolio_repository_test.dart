import 'package:flutter_test/flutter_test.dart';
import 'package:invest_portfolio/features/portfolio/domain/entities/time_series_point.dart';
import 'package:invest_portfolio/features/portfolio/data/repositories/fake_portfolio_repository.dart';

void main() {
  group('FakePortfolioRepository', () {
    final repo = FakePortfolioRepository();

    test('getOverview returns static overview with 3 assets', () async {
      final overview = await repo.getOverview();

      expect(overview.assets.length, 3);
      expect(overview.totalValue, greaterThan(0));

      final apple = overview.assets.firstWhere((a) => a.symbol == 'AAPL');
      expect(apple.name, 'Apple Inc.');
      expect(apple.quantity, 10);
      expect(apple.currentPrice, 212.34);
      expect(apple.changePercent, 1.23);
    });

    test('getTimeSeries returns 30 points sorted by date', () async {
      final List<TimeSeriesPoint> points = await repo.getTimeSeries();

      expect(points, isNotEmpty);
      expect(points.length, 30);

      for (int i = 1; i < points.length; i++) {
        expect(
          points[i].timestamp.isAfter(points[i - 1].timestamp),
          isTrue,
          reason: 'timestamps should come in ascending order',
        );
      }
    });

    test('watchOverview returns empty stream', () async {
      final stream = repo.watchOverview();

      expect(await stream.isEmpty, isTrue);
    });
  });
}
