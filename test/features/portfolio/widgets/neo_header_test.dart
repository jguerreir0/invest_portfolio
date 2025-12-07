import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:invest_portfolio/core/core.dart';
import 'package:invest_portfolio/features/portfolio/presentation/widgets/neobank/neo_header.dart';

import '../../../test_helpers.dart';

void main() {
  final theme = AppThemeData.neo();

  group('NeoHeader', () {
    testWidgets('shows balance and positive change', (tester) async {
      await pumpTest(
        tester: tester,
        child: const NeoHeader(
          totalValue: 4554.40,
          dailyChangePercent: 13.43,
        ),
        theme: theme,
      );

      expect(find.text('Balance'), findsOneWidget);
      expect(find.text('€ 4554.40'), findsOneWidget);
      expect(find.text('13.43% today'), findsOneWidget);
      expect(find.byIcon(Icons.trending_up_rounded), findsOneWidget);
    });

    testWidgets('shows negative trend icon when dailyChangePercent is < 0', (tester) async {
      await pumpTest(
        tester: tester,
        child: const NeoHeader(
          totalValue: 4000,
          dailyChangePercent: -5.0,
        ),
        theme: theme,
      );

      expect(find.byIcon(Icons.trending_down_rounded), findsOneWidget);
    });
  });
}
