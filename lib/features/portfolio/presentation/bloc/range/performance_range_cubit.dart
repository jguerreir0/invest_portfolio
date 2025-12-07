import 'package:flutter_bloc/flutter_bloc.dart';

enum PerformanceRange { d1, w1, m1, m3, y1 }

class PerformanceRangeCubit extends Cubit<PerformanceRange> {
  PerformanceRangeCubit() : super(PerformanceRange.d1);

  void setRange(PerformanceRange range) => emit(range);
}
