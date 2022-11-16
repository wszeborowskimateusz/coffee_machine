import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vgv_coffee_machine/features/settings/domain/repositories/settings_repository.dart';
import 'package:vgv_coffee_machine/features/settings/domain/use_cases/change_theme_mode_use_case.dart';

import '../../../../test_utils/mocks.dart';
import '../../../../test_utils/test_data.dart';

void main() {
  final SettingsRepository repositoryMock = SettingsRepositoryMock();
  late final ChangeThemeModeUseCase useCase;

  setUpAll(() {
    useCase = ChangeThemeModeUseCase(repositoryMock);
  });

  test('Should properly handle success', () async {
    // Arrange
    when(() => repositoryMock.saveThemeMode(tCustomThemeMode))
        .thenAnswer((_) async => const Right(null));

    // Act
    final response = await useCase(tCustomThemeMode);

    // Assert
    expect(response, const Right(null));
    verify(() => repositoryMock.saveThemeMode(tCustomThemeMode)).called(1);
  });

  test('Should properly handle failure', () async {
    // Arrange
    when(() => repositoryMock.saveThemeMode(tCustomThemeMode))
        .thenAnswer((_) async => const Left(tGeneralFailure));

    // Act
    final response = await useCase(tCustomThemeMode);

    // Assert
    expect(response, const Left(tGeneralFailure));
    verify(() => repositoryMock.saveThemeMode(tCustomThemeMode)).called(1);
  });
}
