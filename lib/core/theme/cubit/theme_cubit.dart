import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invest_portfolio/core/theme/app_theme.dart';

class ThemeCubit extends Cubit<AppTheme> {
  ThemeCubit() : super(AppTheme.retailBank);

  void toggle() {
    emit(state == AppTheme.retailBank ? AppTheme.neoBank : AppTheme.retailBank);
  }

  void setTheme(AppTheme theme) => emit(theme);
}
