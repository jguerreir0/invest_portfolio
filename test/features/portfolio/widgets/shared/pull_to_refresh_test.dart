import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:invest_portfolio/features/portfolio/portfolio.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../test_helpers.dart';

void main() {
  late MockPortfolioBloc bloc;

  setUp(() {
    bloc = MockPortfolioBloc();

    when(() => bloc.stream).thenAnswer((_) => const Stream.empty());
  });

  testWidgets('PullToRefresh calls PortfolioStarted with onRefresh', (tester) async {
    await pumpWithBloc<PortfolioBloc>(
      tester: tester,
      child: PullToRefresh(
        child: ListView(
          children: [
            Text('content'),
          ],
        ),
      ),
      bloc: bloc,
    );

    final refreshWidget = tester.widget<RefreshIndicator>(find.byType(RefreshIndicator));

    await tester.runAsync(() async {
      await refreshWidget.onRefresh();
    });

    verify(() => bloc.add(const PortfolioStarted())).called(1);
  });
}
