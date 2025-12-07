import 'dart:math';

import '../../domain/entities/asset.dart';
import '../../domain/entities/portfolio_overview.dart';
import '../../domain/entities/time_series_point.dart';
import '../../domain/repositories/portfolio_repository.dart';

class FakePortfolioRepository implements PortfolioRepository {
  @override
  Future<PortfolioOverview> getOverview() async {
    await Future.delayed(const Duration(milliseconds: 500));

    const assets = <Asset>[
      Asset(
        id: '1',
        symbol: 'AAPL',
        name: 'Apple Inc.',
        quantity: 10,
        currentPrice: 212.34,
        changePercent: 1.23,
        weight: 0.32,
      ),
      Asset(
        id: '2',
        symbol: 'TSLA',
        name: 'Tesla Inc.',
        quantity: 5,
        currentPrice: 189.12,
        changePercent: -0.87,
        weight: 0.21,
      ),
      Asset(
        id: '3',
        symbol: 'VWCE',
        name: 'Vanguard FTSE All-World',
        quantity: 20,
        currentPrice: 102.45,
        changePercent: 0.45,
        weight: 0.47,
      ),
    ];

    final totalValue = assets.fold<double>(
      0,
      (sum, a) => sum + a.quantity * a.currentPrice,
    );

    return PortfolioOverview(
      totalValue: totalValue,
      dailyChangePercent: 2.34,
      assets: assets,
    );
  }

  @override
  Future<List<TimeSeriesPoint>> getTimeSeries() async {
    await Future.delayed(const Duration(milliseconds: 400));

    final now = DateTime.now();
    final random = Random(42);
    double base = 120000;

    final points = <TimeSeriesPoint>[];

    for (int i = 30; i > 0; i--) {
      base += random.nextDouble() * 2000 - 1000;
      points.add(
        TimeSeriesPoint(
          timestamp: now.subtract(Duration(days: i)),
          value: base,
        ),
      );
    }

    return points;
  }

  @override
  Stream<PortfolioOverview> watchOverview() {
    return Stream.empty();
  }
}
