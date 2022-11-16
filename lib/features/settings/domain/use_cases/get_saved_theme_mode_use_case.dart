import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:vgv_coffee_machine/core/domain/use_case/use_case.dart';
import 'package:vgv_coffee_machine/core/errors/failure.dart';
import 'package:vgv_coffee_machine/features/settings/domain/models/custom_theme_mode.dart';
import 'package:vgv_coffee_machine/features/settings/domain/repositories/settings_repository.dart';

@lazySingleton
class GetSavedThemeModeUseCase
    extends UseCase<Either<Failure, CustomThemeMode>, NoParams?> {
  final SettingsRepository _settingsRepository;

  GetSavedThemeModeUseCase(this._settingsRepository);

  @override
  Either<Failure, CustomThemeMode> call([NoParams? _]) =>
      _settingsRepository.getSavedThemeMode();
}
