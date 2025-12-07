import 'dart:io';
import 'dart:math';

import 'package:fixnum/fixnum.dart';
import 'package:grpc/grpc.dart';

import 'package:invest_portfolio/src/generated/portfolio.pbgrpc.dart';

// ----------------- Market State Simulation -----------------

double _applePrice = 212.34;
double _teslaPrice = 189.12;
double _vwcePrice = 102.45;
double _prevTotalValue = 0;

final _random = Random();

// Apply variation to the prices
double _jitter(double value) {
  final delta = 0.1 * (2 * _random.nextDouble() - 1);
  return value * (1 + delta);
}

PortfolioOverview _buildOverviewSnapshot() {
  // store old prices
  final oldApple = _applePrice;
  final oldTesla = _teslaPrice;
  final oldVwce = _vwcePrice;

  _applePrice = _jitter(_applePrice);
  _teslaPrice = _jitter(_teslaPrice);
  _vwcePrice = _jitter(_vwcePrice);

  final appleChangePercent = ((_applePrice - oldApple) / oldApple) * 100;
  final teslaChangePercent = ((_teslaPrice - oldTesla) / oldTesla) * 100;
  final vwceChangePercent = ((_vwcePrice - oldVwce) / oldVwce) * 100;

  final assets = <Asset>[
    Asset()
      ..id = '1'
      ..symbol = 'AAPL'
      ..name = 'Apple Inc.'
      ..quantity = 10
      ..currentPrice = _applePrice
      ..changePercent = appleChangePercent
      ..weight = 0.32,
    Asset()
      ..id = '2'
      ..symbol = 'TSLA'
      ..name = 'Tesla Inc.'
      ..quantity = 5
      ..currentPrice = _teslaPrice
      ..changePercent = teslaChangePercent
      ..weight = 0.21,
    Asset()
      ..id = '3'
      ..symbol = 'VWCE'
      ..name = 'Vanguard FTSE All-World'
      ..quantity = 20
      ..currentPrice = _vwcePrice
      ..changePercent = vwceChangePercent
      ..weight = 0.47,
  ];

  final totalValue = assets.fold<double>(
    0,
    (sum, a) => sum + a.quantity * a.currentPrice,
  );

  final portfolioChangePercent = _prevTotalValue == 0 ? 0.0 : ((totalValue - _prevTotalValue) / _prevTotalValue) * 100;

  _prevTotalValue = totalValue;

  return PortfolioOverview()
    ..assets.addAll(assets)
    ..totalValue = totalValue
    ..dailyChangePercent = portfolioChangePercent;
}

class PortfolioServiceImpl extends PortfolioServiceBase {
  @override
  Future<PortfolioOverview> getOverview(
    ServiceCall call,
    Empty request,
  ) async {
    stdout.writeln('GetOverview called');
    return _buildOverviewSnapshot();
  }

  @override
  Future<PortfolioTimeSeriesResponse> getTimeSeries(
    ServiceCall call,
    Empty request,
  ) async {
    stdout.writeln('GetTimeSeries called');

    final overview = _buildOverviewSnapshot();
    final nowTotal = overview.totalValue;

    final now = DateTime.now();
    final tmp = <TimeSeriesPoint>[];

    double value = nowTotal;

    for (int i = 0; i <= 30; i++) {
      final ts = now.subtract(Duration(days: i));

      tmp.add(
        TimeSeriesPoint()
          ..timestampMs = Int64(ts.millisecondsSinceEpoch)
          ..value = value,
      );

      final deltaPercent = (_random.nextDouble() * 0.06) - 0.03;
      value = value * (1 - deltaPercent);

      if (value < nowTotal * 0.5) value = nowTotal * 0.5;
      if (value > nowTotal * 1.5) value = nowTotal * 1.5;
    }

    tmp.sort((a, b) => a.timestampMs.compareTo(b.timestampMs));

    final response = PortfolioTimeSeriesResponse();
    response.points.addAll(tmp);
    return response;
  }

  @override
  Stream<PortfolioOverview> streamOverview(
    ServiceCall call,
    Empty request,
  ) async* {
    stdout.writeln('StreamOverview subscribed');

    while (!call.isCanceled) {
      yield _buildOverviewSnapshot();
      await Future.delayed(const Duration(seconds: 4));
    }

    stdout.writeln('StreamOverview cancelled');
  }

  @override
  Future<HealthCheckResponse> healthCheck(
    ServiceCall call,
    Empty request,
  ) async {
    return HealthCheckResponse()..status = 'ok';
  }
}

Future<void> main(List<String> args) async {
  final server = Server.create(
    services: [
      PortfolioServiceImpl(),
    ],
    codecRegistry: CodecRegistry(
      codecs: const [
        GzipCodec(),
        IdentityCodec(),
      ],
    ),
  );

  const port = 50051;
  await server.serve(port: port);
  stdout.writeln('gRPC server listening on port $port');
}
