import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:vgv_coffee_machine/core/domain/use_case/use_case.dart';
import 'package:vgv_coffee_machine/core/errors/failure.dart';
import 'package:vgv_coffee_machine/features/settings/domain/models/custom_theme_mode.dart';
import 'package:vgv_coffee_machine/features/settings/domain/repositories/settings_repository.dart';

@lazySingleton
class ChangeThemeModeUseCase
    extends UseCase<Future<Either<Failure, void>>, CustomThemeMode> {
  final SettingsRepository _settingsRepository;

  ChangeThemeModeUseCase(this._settingsRepository);

  @override
  Future<Either<Failure, void>> call(CustomThemeMode themeMode) =>
      _settingsRepository.saveThemeMode(themeMode);
}
