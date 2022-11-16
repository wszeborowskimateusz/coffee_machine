import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vgv_coffee_machine/features/settings/domain/repositories/settings_repository.dart';
import 'package:vgv_coffee_machine/features/settings/domain/use_cases/get_saved_theme_mode_use_case.dart';

import '../../../../test_utils/mocks.dart';
import '../../../../test_utils/test_data.dart';

void main() {
  final SettingsRepository repositoryMock = SettingsRepositoryMock();
  late final GetSavedThemeModeUseCase useCase;

  setUpAll(() {
    useCase = GetSavedThemeModeUseCase(repositoryMock);
  });

  test('Should properly handle success', () {
    // Arrange
    when(() => repositoryMock.getSavedThemeMode())
        .thenReturn(const Right(tCustomThemeMode));

    // Act
    final response = useCase();

    // Assert
    expect(response, const Right(tCustomThemeMode));
    verify(() => repositoryMock.getSavedThemeMode()).called(1);
  });

  test('Should properly handle failure', () {
    // Arrange
    when(() => repositoryMock.getSavedThemeMode())
        .thenReturn(const Left(tGeneralFailure));

    // Act
    final response = useCase();

    // Assert
    expect(response, const Left(tGeneralFailure));
    verify(() => repositoryMock.getSavedThemeMode()).called(1);
  });
}
