import 'package:flutter_test/flutter_test.dart';
import 'package:invest_portfolio/features/portfolio/portfolio.dart';

import '../../../test_helpers.dart';

void main() {
  const assets = [
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
  ];

  final widgetUnderTest = const RetailHoldingsCard(assets: assets);

  group('RetailHoldingsCard', () {
    testWidgets('renders header and asset rows', (tester) async {
      await pumpTest(tester: tester, child: widgetUnderTest);

      expect(find.text('Holdings'), findsOneWidget);
      expect(find.text('Sorted by weight'), findsOneWidget);

      expect(find.text('Apple Inc.'), findsOneWidget);
      expect(find.text('Tesla Inc.'), findsOneWidget);

      expect(find.textContaining('AAPL • 32.0% of portfolio'), findsOneWidget);
      expect(find.textContaining('TSLA • 21.0% of portfolio'), findsOneWidget);
    });

    testWidgets('shows percentage change formatted', (tester) async {
      await pumpTest(tester: tester, child: widgetUnderTest);

      expect(find.text('1.23%'), findsOneWidget);
      expect(find.text('-0.87%'), findsOneWidget);
    });
  });
}
