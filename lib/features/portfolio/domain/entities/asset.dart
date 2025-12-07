class Asset {
  const Asset({
    required this.id,
    required this.symbol,
    required this.name,
    required this.quantity,
    required this.currentPrice,
    required this.changePercent,
    required this.weight,
  });

  final String id;
  final String symbol;
  final String name;
  final double quantity;
  final double currentPrice;
  final double changePercent;
  final double weight;
}
