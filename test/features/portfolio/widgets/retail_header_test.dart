import 'package:flutter_test/flutter_test.dart';
import 'package:invest_portfolio/features/portfolio/portfolio.dart';

import '../../../test_helpers.dart';

void main() {
  final widgetUnderTest = const RetailHeader(totalValue: 4553.43, dailyChangePercent: 34.47);

  testWidgets('RetailHeader shows total and percent formatted', (tester) async {
    await pumpTest(tester: tester, child: widgetUnderTest);

    expect(find.text('Total portfolio value'), findsOneWidget);
    expect(find.text('€ 4553.43'), findsOneWidget);
    expect(find.text('34.47% today'), findsOneWidget);
  });
}
