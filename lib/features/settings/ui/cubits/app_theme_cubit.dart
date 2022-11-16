import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:vgv_coffee_machine/core/constants/constants.dart';
import 'package:vgv_coffee_machine/features/settings/domain/models/custom_theme_mode.dart';
import 'package:vgv_coffee_machine/features/settings/domain/use_cases/change_theme_mode_use_case.dart';
import 'package:vgv_coffee_machine/features/settings/domain/use_cases/get_saved_theme_mode_use_case.dart';

@singleton
class AppThemeCubit extends Cubit<CustomThemeMode> {
  final GetSavedThemeModeUseCase _getSavedThemeModeUseCase;
  final ChangeThemeModeUseCase _changeThemeModeUseCase;

  AppThemeCubit(this._getSavedThemeModeUseCase, this._changeThemeModeUseCase)
      : super(Constants.defaultThemeMode) {
    _init();
  }

  void _init() {
    _getSavedThemeModeUseCase().fold(
      (_) => null,
      (savedThemeMode) => emit(savedThemeMode),
    );
  }

  Future<void> changeThemeMode(CustomThemeMode themeMode) async {
    (await _changeThemeModeUseCase(themeMode)).fold(
      (_) => null,
      (_) => emit(themeMode),
    );
  }
}
