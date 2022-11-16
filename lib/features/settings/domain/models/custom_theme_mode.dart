import 'package:flutter/material.dart';

enum CustomThemeMode { light, dark }

extension CustomThemeModeExtension on CustomThemeMode {
  ThemeMode get themeMode =>
      this == CustomThemeMode.light ? ThemeMode.light : ThemeMode.dark;

  CustomThemeMode get opposite => this == CustomThemeMode.light
      ? CustomThemeMode.dark
      : CustomThemeMode.light;
}
