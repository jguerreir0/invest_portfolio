import 'package:flutter/material.dart';
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

  testWidgets('NeoHeader shows balance and daily variation', (tester) async {
    await pumpTest(
      tester: tester,
      child: const NeoHeader(
        totalValue: 4554.40,
        dailyChangePercent: 13.43,
      ),
    );

    expect(find.text('Balance'), findsOneWidget);
    expect(find.textContaining('€ 4554.40'), findsOneWidget);
    expect(find.textContaining('% today'), findsOneWidget);
  });

  testWidgets('NeoAssetTile shows symbol, name and price', (tester) async {
    final asset = assets.first;

    await pumpTest(
      tester: tester,
      child: Builder(
        builder: (context) => NeoAssetTile(
          asset: asset,
          textTheme: Theme.of(context).textTheme,
        ),
      ),
    );

    expect(find.text('Apple Inc.'), findsOneWidget);
    expect(find.text('AAPL'), findsOneWidget);
    expect(find.textContaining('€ 212.34'), findsOneWidget);
  });

  testWidgets('NeoHoldingsBody shows header "Your assets" and each asset', (tester) async {
    await pumpTest(
      tester: tester,
      child: NeoHoldingsBody(assets: assets),
    );

    expect(find.text('Your assets'), findsOneWidget);
    expect(find.text('Apple Inc.'), findsOneWidget);
  });

  testWidgets('PeriodChips allows to select different ranges', (tester) async {
    var selected = PerformanceRange.d1;

    await pumpTest(
      tester: tester,
      child: PeriodChips(
        selected: selected,
        onSelected: (range) => selected = range,
      ),
    );

    expect(find.text('1D'), findsOneWidget);
    expect(find.text('1Y'), findsOneWidget);

    await tester.tap(find.text('1Y'));
    await tester.pumpAndSettle();

    expect(selected, PerformanceRange.y1);
  });
}
