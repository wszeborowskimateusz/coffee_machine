import 'package:injectable/injectable.dart';
import 'package:vgv_coffee_machine/core/constants/constants.dart';
import 'package:vgv_coffee_machine/core/local_storage/local_storage_service.dart';
import 'package:vgv_coffee_machine/core/local_storage/local_storage_service_keys.dart';
import 'package:vgv_coffee_machine/features/settings/data/data_sources/settings_local_data_source.dart';
import 'package:vgv_coffee_machine/features/settings/domain/models/custom_theme_mode.dart';

@LazySingleton(as: SettingsLocalDataSource)
class SettingsLocalDataSourceImpl extends SettingsLocalDataSource {
  final LocalStorageService _localStorageService;

  SettingsLocalDataSourceImpl(this._localStorageService);

  @override
  CustomThemeMode? getSavedThemeMode() {
    final storageValue = _localStorageService.getString(
      LocalStorageServiceKeys.themeMode,
    );

    switch (storageValue) {
      case Constants.themeModeDarkStorageValue:
        return CustomThemeMode.dark;
      case Constants.themeModeLightStorageValue:
        return CustomThemeMode.light;
      default:
        return null;
    }
  }

  @override
  Future<void> saveThemeMode(CustomThemeMode themeMode) async {
    final valueToStore = themeMode == CustomThemeMode.light
        ? Constants.themeModeLightStorageValue
        : Constants.themeModeDarkStorageValue;

    await _localStorageService.saveString(
      LocalStorageServiceKeys.themeMode,
      valueToStore,
    );
  }
}
