import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invest_portfolio/core/core.dart';
import '../features/portfolio/portfolio.dart';

class InvestPortfolioApp extends StatelessWidget {
  const InvestPortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    final grpcClient = PortfolioGrpcClient(
      host: 'localhost',
      port: 50051,
    );

    final repository = GrpcPortfolioRepository(client: grpcClient);

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ThemeCubit()),
        BlocProvider(
          create: (_) => PortfolioBloc(
            getTimeSeries: GetPortfolioTimeSeries(repository),
            watchOverview: WatchPortfolioOverview(repository),
          )..add(const PortfolioStarted()),
        ),
      ],
      child: BlocBuilder<ThemeCubit, AppTheme>(
        builder: (context, theme) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Invest Portfolio',
            theme: AppThemeData.retail(),
            darkTheme: AppThemeData.neo(),
            themeMode: _mapThemeMode(theme),
            home: const PortfolioPage(),
          );
        },
      ),
    );
  }

  ThemeMode _mapThemeMode(AppTheme theme) {
    switch (theme) {
      case AppTheme.retailBank:
        return ThemeMode.light;
      case AppTheme.neoBank:
        return ThemeMode.dark;
    }
  }
}
