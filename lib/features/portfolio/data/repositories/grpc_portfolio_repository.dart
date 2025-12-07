import 'package:invest_portfolio/features/portfolio/portfolio.dart';
import 'package:invest_portfolio/src/generated/portfolio.pb.dart' as proto;

class GrpcPortfolioRepository implements PortfolioRepository {
  GrpcPortfolioRepository({required this.client});

  final PortfolioGrpcClient client;

  @override
  Future<PortfolioOverview> getOverview() async {
    final response = await client.getOverview();
    return _mapOverview(response);
  }

  @override
  Future<List<TimeSeriesPoint>> getTimeSeries() async {
    final response = await client.getTimeSeries();

    return response.points
        .map(
          (p) => TimeSeriesPoint(
            timestamp: DateTime.fromMillisecondsSinceEpoch(p.timestampMs.toInt()),
            value: p.value,
          ),
        )
        .toList();
  }

  @override
  Stream<PortfolioOverview> watchOverview() async* {
    final stream = client.streamOverview();

    await for (final pbOverview in stream) {
      yield _mapOverview(pbOverview);
    }
  }

  PortfolioOverview _mapOverview(proto.PortfolioOverview response) {
    final assets = response.assets.map(_mapAsset).toList();

    return PortfolioOverview(
      totalValue: response.totalValue,
      dailyChangePercent: response.dailyChangePercent,
      assets: assets,
    );
  }

  Asset _mapAsset(proto.Asset a) {
    return Asset(
      id: a.id,
      symbol: a.symbol,
      name: a.name,
      quantity: a.quantity,
      currentPrice: a.currentPrice,
      changePercent: a.changePercent,
      weight: a.weight,
    );
  }
}
