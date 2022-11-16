import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vgv_coffee_machine/core/constants/constants.dart';
import 'package:vgv_coffee_machine/core/services/local_storage/local_storage_service.dart';
import 'package:vgv_coffee_machine/core/services/local_storage/local_storage_service_keys.dart';
import 'package:vgv_coffee_machine/features/settings/data/data_sources/settings_local_data_source.dart';
import 'package:vgv_coffee_machine/features/settings/data/data_sources/settings_local_data_source_impl.dart';
import 'package:vgv_coffee_machine/features/settings/domain/models/custom_theme_mode.dart';

import '../../../../test_utils/mocks.dart';

void main() {
  final String key = LocalStorageServiceKeys.themeMode;

  final LocalStorageService localStorageServiceMock = LocalStorageServiceMock();
  late final SettingsLocalDataSource dataSource;

  setUpAll(() {
    dataSource = SettingsLocalDataSourceImpl(localStorageServiceMock);
  });

  group('getSavedThemeMode', () {
    test('Should properly read value from storage: light theme', () {
      // Arrange
      when(() => localStorageServiceMock.getString(key))
          .thenReturn(Constants.themeModeLightStorageValue);

      // Act
      final response = dataSource.getSavedThemeMode();

      // Assert
      expect(response, CustomThemeMode.light);
      verify(() => localStorageServiceMock.getString(key)).called(1);
    });

    test('Should properly read value from storage: dark theme', () {
      // Arrange
      when(() => localStorageServiceMock.getString(key))
          .thenReturn(Constants.themeModeDarkStorageValue);

      // Act
      final response = dataSource.getSavedThemeMode();

      // Assert
      expect(response, CustomThemeMode.dark);
      verify(() => localStorageServiceMock.getString(key)).called(1);
    });

    test('Should properly read value from storage: invalid value', () {
      // Arrange
      when(() => localStorageServiceMock.getString(key)).thenReturn('invalid');

      // Act
      final response = dataSource.getSavedThemeMode();

      // Assert
      expect(response, isNull);
      verify(() => localStorageServiceMock.getString(key)).called(1);
    });

    test('Should return null when key is not present in local storage', () {
      // Arrange
      when(() => localStorageServiceMock.getString(key)).thenReturn(null);

      // Act
      final response = dataSource.getSavedThemeMode();

      // Assert
      expect(response, isNull);
      verify(() => localStorageServiceMock.getString(key)).called(1);
    });
  });

  group('saveThemeMode', () {
    test('Should properly call the local storage service: light theme',
        () async {
      // Arrange
      const encodedValue = Constants.themeModeLightStorageValue;

      when(() => localStorageServiceMock.saveString(key, encodedValue))
          .thenAnswer((_) async => true);

      // Act
      await dataSource.saveThemeMode(CustomThemeMode.light);

      // Assert
      verify(() => localStorageServiceMock.saveString(key, encodedValue))
          .called(1);
    });

    test('Should properly call the local storage service: dark theme',
        () async {
      // Arrange
      const encodedValue = Constants.themeModeDarkStorageValue;

      when(() => localStorageServiceMock.saveString(key, encodedValue))
          .thenAnswer((_) async => true);

      // Act
      await dataSource.saveThemeMode(CustomThemeMode.dark);

      // Assert
      verify(() => localStorageServiceMock.saveString(key, encodedValue))
          .called(1);
    });
  });
}
