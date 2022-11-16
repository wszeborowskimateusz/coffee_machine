import 'package:dartz/dartz.dart';
import 'package:vgv_coffee_machine/core/errors/failure.dart';
import 'package:vgv_coffee_machine/features/settings/domain/models/custom_theme_mode.dart';

abstract class SettingsRepository {
  Either<Failure, CustomThemeMode> getSavedThemeMode();

  Future<Either<Failure, void>> saveThemeMode(CustomThemeMode themeMode);
}
