import 'asset.dart';

class PortfolioOverview {
  const PortfolioOverview({
    required this.totalValue,
    required this.dailyChangePercent,
    required this.assets,
  });

  final double totalValue;
  final double dailyChangePercent;
  final List<Asset> assets;
}
