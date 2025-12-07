import 'package:flutter_test/flutter_test.dart';
import 'package:invest_portfolio/features/portfolio/presentation/bloc/range/performance_range_cubit.dart';

void main() {
  final cubit = PerformanceRangeCubit();
  group('PerformanceRangeCubit', () {
    test('initial state is d1', () {
      expect(cubit.state, PerformanceRange.d1);
    });

    test('setRange changes the state', () {
      cubit.setRange(PerformanceRange.m1);
      expect(cubit.state, PerformanceRange.m1);

      cubit.setRange(PerformanceRange.y1);
      expect(cubit.state, PerformanceRange.y1);
    });
  });
}
