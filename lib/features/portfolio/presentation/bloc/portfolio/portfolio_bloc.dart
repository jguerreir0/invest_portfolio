import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invest_portfolio/features/portfolio/portfolio.dart';

class PortfolioBloc extends Bloc<PortfolioEvent, PortfolioState> {
  PortfolioBloc({
    required GetPortfolioTimeSeries getTimeSeries,
    required WatchPortfolioOverview watchOverview,
  })  : _getTimeSeries = getTimeSeries,
        _watchOverview = watchOverview,
        super(const PortfolioInitial()) {
    on<PortfolioStarted>(_onStarted);
    on<PortfolioOverviewUpdated>(_onOverviewUpdated);
    on<PortfolioStreamFailed>(_onStreamFailed);
  }

  final GetPortfolioTimeSeries _getTimeSeries;
  final WatchPortfolioOverview _watchOverview;

  StreamSubscription<PortfolioOverview>? _overviewSub;
  List<TimeSeriesPoint> _cachedSeries = const [];

  Future<void> _onStarted(
    PortfolioStarted event,
    Emitter<PortfolioState> emit,
  ) async {
    emit(const PortfolioLoading());

    try {
      _cachedSeries = await _getTimeSeries();

      await _overviewSub?.cancel();
      _overviewSub = _watchOverview().listen(
        (overview) {
          add(PortfolioOverviewUpdated(overview));
        },
        onError: (_, __) {
          add(const PortfolioStreamFailed());
        },
      );
    } catch (_) {
      emit(const PortfolioError('Failed to load portfolio data.'));
    }
  }

  void _onOverviewUpdated(
    PortfolioOverviewUpdated event,
    Emitter<PortfolioState> emit,
  ) {
    final now = DateTime.now();

    final updatedSeries = List<TimeSeriesPoint>.from(_cachedSeries)
      ..add(
        TimeSeriesPoint(
          timestamp: now,
          value: event.overview.totalValue,
        ),
      );

    const maxPoints = 60;
    if (updatedSeries.length > maxPoints) {
      updatedSeries.removeAt(0);
    }

    _cachedSeries = updatedSeries;

    emit(
      PortfolioLoaded(
        overview: event.overview,
        timeSeries: updatedSeries,
      ),
    );
  }

  void _onStreamFailed(
    PortfolioStreamFailed event,
    Emitter<PortfolioState> emit,
  ) {
    emit(const PortfolioError('Failed to stream portfolio data.'));
  }

  @override
  Future<void> close() {
    _overviewSub?.cancel();
    return super.close();
  }
}
