import '../../../domain/entities/portfolio_overview.dart';

abstract class PortfolioEvent {
  const PortfolioEvent();
}

class PortfolioStarted extends PortfolioEvent {
  const PortfolioStarted();
}

class PortfolioOverviewUpdated extends PortfolioEvent {
  const PortfolioOverviewUpdated(this.overview);

  final PortfolioOverview overview;
}

class PortfolioStreamFailed extends PortfolioEvent {
  const PortfolioStreamFailed();
}
