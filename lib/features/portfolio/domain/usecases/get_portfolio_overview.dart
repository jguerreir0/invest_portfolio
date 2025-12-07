import '../entities/portfolio_overview.dart';
import '../repositories/portfolio_repository.dart';

class GetPortfolioOverview {
  const GetPortfolioOverview(this.repository);

  final PortfolioRepository repository;

  Future<PortfolioOverview> call() {
    return repository.getOverview();
  }
}
