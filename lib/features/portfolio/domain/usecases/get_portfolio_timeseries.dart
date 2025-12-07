import '../entities/time_series_point.dart';
import '../repositories/portfolio_repository.dart';

class GetPortfolioTimeSeries {
  const GetPortfolioTimeSeries(this.repository);

  final PortfolioRepository repository;

  Future<List<TimeSeriesPoint>> call() {
    return repository.getTimeSeries();
  }
}
