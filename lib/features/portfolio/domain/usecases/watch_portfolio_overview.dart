import '../entities/portfolio_overview.dart';
import '../repositories/portfolio_repository.dart';

class WatchPortfolioOverview {
  const WatchPortfolioOverview(this.repository);

  final PortfolioRepository repository;

  Stream<PortfolioOverview> call() {
    return repository.watchOverview();
  }
}
