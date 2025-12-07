import 'package:grpc/grpc.dart';
import 'package:invest_portfolio/src/generated/portfolio.pb.dart' as proto;
import 'package:invest_portfolio/src/generated/portfolio.pbgrpc.dart' as proto_grpc;

class PortfolioGrpcClient {
  PortfolioGrpcClient({
    required String host,
    required int port,
    bool useTls = false,
  })  : _channel = ClientChannel(
          host,
          port: port,
          options: ChannelOptions(
            credentials: useTls ? const ChannelCredentials.secure() : const ChannelCredentials.insecure(),
          ),
        ),
        _client = proto_grpc.PortfolioServiceClient(
          ClientChannel(
            host,
            port: port,
            options: ChannelOptions(
              credentials: useTls ? const ChannelCredentials.secure() : const ChannelCredentials.insecure(),
            ),
          ),
        );

  final ClientChannel _channel;
  final proto_grpc.PortfolioServiceClient _client;

  Future<proto.PortfolioOverview> getOverview() {
    return _client.getOverview(proto.Empty());
  }

  Future<proto.PortfolioTimeSeriesResponse> getTimeSeries() {
    return _client.getTimeSeries(proto.Empty());
  }

  Stream<proto.PortfolioOverview> streamOverview() {
    return _client.streamOverview(proto.Empty());
  }

  Future<void> dispose() async {
    await _channel.shutdown();
  }
}
