import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:invest_portfolio/core/core.dart';
import 'package:invest_portfolio/features/portfolio/portfolio.dart';

import '../../../../test_helpers.dart';

void main() {
  late ThemeCubit themeCubit;
  late MockPortfolioBloc portfolioBloc;

  setUp(() {
    themeCubit = ThemeCubit();
    portfolioBloc = MockPortfolioBloc();

    whenListen(
      portfolioBloc,
      const Stream<PortfolioState>.empty(),
      initialState: const PortfolioInitial(),
    );
  });

  testWidgets('shows "Portfolio overview" in mode Retail', (tester) async {
    await pumpWithBloc<PortfolioBloc>(
      tester: tester,
      child: const PortfolioPage(),
      bloc: portfolioBloc,
    );

    expect(find.text('Portfolio overview'), findsOneWidget);
    expect(find.text('Money in motion'), findsNothing);
  });

  testWidgets('changes title to "Money in motion" in mode Neobank', (tester) async {
    await pumpWithBloc<PortfolioBloc>(
      tester: tester,
      child: const PortfolioPage(),
      bloc: portfolioBloc,
      themeCubit: themeCubit,
    );

    themeCubit.setTheme(AppTheme.neoBank);
    await tester.pump();

    expect(find.text('Money in motion'), findsOneWidget);
    expect(find.text('Portfolio overview'), findsNothing);
  });
}
