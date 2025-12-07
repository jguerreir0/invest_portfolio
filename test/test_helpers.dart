import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:invest_portfolio/core/core.dart';
import 'package:invest_portfolio/features/portfolio/portfolio.dart';
import 'package:mocktail/mocktail.dart';

class MockPortfolioBloc extends Mock implements PortfolioBloc {}

class MockPortfolioRepository extends Mock implements PortfolioRepository {}

class MockPortfolioGrpcClient extends Mock implements PortfolioGrpcClient {}

class MockGetTimeSeries extends Mock implements GetPortfolioTimeSeries {}

class MockWatchOverview extends Mock implements WatchPortfolioOverview {}

Future<void> pumpTest({required WidgetTester tester, required Widget child, ThemeData? theme}) async {
  await tester.pumpWidget(
    MaterialApp(
      theme: theme ?? AppThemeData.retail(),
      home: Scaffold(
        body: child,
      ),
    ),
  );
}

Future<void> pumpWithBloc<B extends BlocBase<Object?>>({
  required WidgetTester tester,
  required Widget child,
  required B bloc,
  ThemeData? theme,
  ThemeData? darkTheme,
  ThemeCubit? themeCubit,
}) async {
  await tester.pumpWidget(
    MaterialApp(
      theme: theme ?? AppThemeData.retail(),
      darkTheme: darkTheme ?? AppThemeData.neo(),
      home: MultiBlocProvider(
        providers: [
          BlocProvider<B>.value(value: bloc),
          BlocProvider<ThemeCubit>.value(value: themeCubit ?? ThemeCubit()),
        ],
        child: Scaffold(
          body: child,
        ),
      ),
    ),
  );

  await tester.pump();
}
