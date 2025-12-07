import '../entities/portfolio_overview.dart';
import '../entities/time_series_point.dart';

abstract class PortfolioRepository {
  Future<PortfolioOverview> getOverview();
  Future<List<TimeSeriesPoint>> getTimeSeries();
  Stream<PortfolioOverview> watchOverview();
}
