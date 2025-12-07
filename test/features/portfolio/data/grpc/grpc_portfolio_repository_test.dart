import 'package:fixnum/fixnum.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:invest_portfolio/features/portfolio/portfolio.dart';
import 'package:mocktail/mocktail.dart';
import 'package:invest_portfolio/src/generated/portfolio.pb.dart' as proto;

import '../../../../test_helpers.dart';

void main() {
  late MockPortfolioGrpcClient client;
  late GrpcPortfolioRepository repository;

  setUp(() {
    client = MockPortfolioGrpcClient();
    repository = GrpcPortfolioRepository(client: client);
  });

  test('getOverview maps proto.PortfolioOverview to domain', () async {
    final overviewPb = proto.PortfolioOverview()
      ..totalValue = 1000
      ..dailyChangePercent = 2.5
      ..assets.addAll([
        proto.Asset()
          ..id = '1'
          ..symbol = 'AAPL'
          ..name = 'Apple Inc.'
          ..quantity = 2
          ..currentPrice = 150
          ..changePercent = 1.2
          ..weight = 0.4,
      ]);

    when(() => client.getOverview()).thenAnswer((_) async => overviewPb);

    final result = await repository.getOverview();

    expect(result.totalValue, 1000);
    expect(result.dailyChangePercent, 2.5);
    expect(result.assets, hasLength(1));

    final asset = result.assets.first;
    expect(asset.id, '1');
    expect(asset.symbol, 'AAPL');
    expect(asset.currentPrice, 150);
    expect(asset.weight, closeTo(0.4, 0.0001));
  });

  test('getTimeSeries maps proto.TimeSeriesPoint to TimeSeriesPoint', () async {
    final now = DateTime.now();
    final pointsPb = [
      proto.TimeSeriesPoint()
        ..timestampMs = Int64(now.millisecondsSinceEpoch)
        ..value = 1234.0,
      proto.TimeSeriesPoint()
        ..timestampMs = Int64(now.subtract(const Duration(days: 1)).millisecondsSinceEpoch)
        ..value = 1200.0,
    ];

    final responsePb = proto.PortfolioTimeSeriesResponse()..points.addAll(pointsPb);

    when(() => client.getTimeSeries()).thenAnswer((_) async => responsePb);

    final result = await repository.getTimeSeries();

    expect(result, hasLength(2));
    expect(result.first, isA<TimeSeriesPoint>());
    expect(result.first.value, 1234.0);
  });

  test('watchOverview returns stream from PortfolioOverview mapped', () async {
    final controller = Stream<proto.PortfolioOverview>.fromIterable([
      proto.PortfolioOverview()
        ..totalValue = 100
        ..dailyChangePercent = 1.0,
      proto.PortfolioOverview()
        ..totalValue = 120
        ..dailyChangePercent = 2.0,
    ]);

    when(() => client.streamOverview()).thenAnswer((_) => controller);

    final result = await repository.watchOverview().toList();

    expect(result, hasLength(2));
    expect(result[0].totalValue, 100);
    expect(result[1].totalValue, 120);
  });
}
