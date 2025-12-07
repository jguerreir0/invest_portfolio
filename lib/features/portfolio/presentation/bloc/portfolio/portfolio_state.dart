import '../../../domain/entities/portfolio_overview.dart';
import '../../../domain/entities/time_series_point.dart';

abstract class PortfolioState {
  const PortfolioState();
}

class PortfolioInitial extends PortfolioState {
  const PortfolioInitial();
}

class PortfolioLoading extends PortfolioState {
  const PortfolioLoading();
}

class PortfolioLoaded extends PortfolioState {
  final PortfolioOverview overview;
  final List<TimeSeriesPoint> timeSeries;

  const PortfolioLoaded({
    required this.overview,
    required this.timeSeries,
  });
}

class PortfolioError extends PortfolioState {
  final String message;
  const PortfolioError(this.message);
}
