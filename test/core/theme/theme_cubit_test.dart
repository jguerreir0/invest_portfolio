import 'package:flutter_test/flutter_test.dart';
import 'package:invest_portfolio/core/theme/app_theme.dart';
import 'package:invest_portfolio/core/theme/cubit/theme_cubit.dart';

void main() {
  group('ThemeCubit', () {
    test('initial state is retailBank', () {
      final cubit = ThemeCubit();
      expect(cubit.state, AppTheme.retailBank);
    });

    test('toggle changes between retail and neo', () {
      final cubit = ThemeCubit();

      cubit.toggle();
      expect(cubit.state, AppTheme.neoBank);

      cubit.toggle();
      expect(cubit.state, AppTheme.retailBank);
    });

    test('setTheme defines the theme', () {
      final cubit = ThemeCubit();

      cubit.setTheme(AppTheme.neoBank);
      expect(cubit.state, AppTheme.neoBank);

      cubit.setTheme(AppTheme.retailBank);
      expect(cubit.state, AppTheme.retailBank);
    });
  });
}
