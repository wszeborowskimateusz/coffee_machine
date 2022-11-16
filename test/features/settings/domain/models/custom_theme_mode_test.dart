import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vgv_coffee_machine/features/settings/domain/models/custom_theme_mode.dart';

void main() {
  group('themeMode', () {
    test('Should properly return theme mode', () {
      expect(CustomThemeMode.light.themeMode, ThemeMode.light);
      expect(CustomThemeMode.dark.themeMode, ThemeMode.dark);
    });
  });

  group('opposite', () {
    test('Should properly return opposite theme mode', () {
      expect(CustomThemeMode.light.opposite, CustomThemeMode.dark);
      expect(CustomThemeMode.dark.opposite, CustomThemeMode.light);
    });
  });
}
