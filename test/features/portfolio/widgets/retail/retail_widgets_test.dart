import 'package:flutter_test/flutter_test.dart';
import 'package:invest_portfolio/features/portfolio/portfolio.dart';

import '../../../../test_helpers.dart';

void main() {
  final assets = [
    const Asset(
      id: '1',
      symbol: 'AAPL',
      name: 'Apple Inc.',
      quantity: 1,
      currentPrice: 212.34,
      changePercent: 1.23,
      weight: 0.32,
    ),
  ];

  testWidgets('RetailHeader shows total and daily variation', (tester) async {
    await pumpTest(
      tester: tester,
      child: const RetailHeader(
        totalValue: 4553.43,
        dailyChangePercent: 3.45,
      ),
    );

    expect(find.text('Total portfolio value'), findsOneWidget);
    expect(find.textContaining('€ 4553.43'), findsOneWidget);
    expect(find.textContaining('% today'), findsOneWidget);
  });

  testWidgets('RetailHoldingsCard lists assets with title and subtitle', (tester) async {
    await pumpTest(
      tester: tester,
      child: RetailHoldingsCard(assets: assets),
    );

    expect(find.text('Holdings'), findsOneWidget);
    expect(find.text('Sorted by weight'), findsOneWidget);
    expect(find.text('Apple Inc.'), findsOneWidget);
    expect(find.textContaining('AAPL'), findsOneWidget);
  });
}
