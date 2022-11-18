import 'package:vgv_coffee_machine/features/settings/domain/models/custom_theme_mode.dart';

abstract class Constants {
  static const String themeModeLightStorageValue = 'light';
  static const String themeModeDarkStorageValue = 'dark';

  static const CustomThemeMode defaultThemeMode = CustomThemeMode.light;
}
