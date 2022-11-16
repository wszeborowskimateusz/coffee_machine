import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vgv_coffee_machine/core/extensions/either_extensions.dart';
import 'package:vgv_coffee_machine/features/settings/data/data_sources/settings_local_data_source.dart';
import 'package:vgv_coffee_machine/features/settings/data/repositories/settings_repository_impl.dart';
import 'package:vgv_coffee_machine/features/settings/domain/repositories/settings_repository.dart';

import '../../../../test_utils/mocks.dart';
import '../../../../test_utils/test_data.dart';

void main() {
  final SettingsLocalDataSource localDataSourceMock =
      SettingsLocalDataSourceMock();
  late final SettingsRepository repository;

  setUpAll(() {
    repository = SettingsRepositoryImpl(localDataSourceMock);
  });

  group('getSavedThemeMode', () {
    test('Should properly read value from local storage', () {
      // Arrange
      when(() => localDataSourceMock.getSavedThemeMode())
          .thenReturn(tCustomThemeMode);

      // Act
      final response = repository.getSavedThemeMode();

      // Assert
      expect(response.isRight(), isTrue);
      expect(response.extractRight(), tCustomThemeMode);
      verify(() => localDataSourceMock.getSavedThemeMode()).called(1);
    });

    test('Should return failure when local storage throws exception', () {
      // Arrange
      when(() => localDataSourceMock.getSavedThemeMode()).thenThrow('');

      // Act
      final response = repository.getSavedThemeMode();

      // Assert
      expect(response.isLeft(), isTrue);
      verify(() => localDataSourceMock.getSavedThemeMode()).called(1);
    });
  });

  group('saveThemeMode', () {
    test('Should properly write value to local storage', () async {
      // Arrange
      when(() => localDataSourceMock.saveThemeMode(tCustomThemeMode))
          .thenAnswer((_) async {});

      // Act
      final response = await repository.saveThemeMode(tCustomThemeMode);

      // Assert
      expect(response.isRight(), isTrue);
      verify(() => localDataSourceMock.saveThemeMode(tCustomThemeMode))
          .called(1);
    });

    test('Should return failure when local storage throws exception', () async {
      // Arrange
      when(() => localDataSourceMock.saveThemeMode(tCustomThemeMode))
          .thenThrow('');

      // Act
      final response = await repository.saveThemeMode(tCustomThemeMode);

      // Assert
      expect(response.isLeft(), isTrue);
      verify(() => localDataSourceMock.saveThemeMode(tCustomThemeMode))
          .called(1);
    });
  });
}
