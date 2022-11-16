import 'package:vgv_coffee_machine/features/settings/domain/models/custom_theme_mode.dart';

abstract class SettingsLocalDataSource {
  CustomThemeMode? getSavedThemeMode();

  Future<void> saveThemeMode(CustomThemeMode themeMode);
}
