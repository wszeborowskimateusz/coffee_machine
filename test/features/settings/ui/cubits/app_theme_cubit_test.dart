import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vgv_coffee_machine/core/constants/constants.dart';
import 'package:vgv_coffee_machine/features/settings/domain/models/custom_theme_mode.dart';
import 'package:vgv_coffee_machine/features/settings/domain/use_cases/change_theme_mode_use_case.dart';
import 'package:vgv_coffee_machine/features/settings/domain/use_cases/get_saved_theme_mode_use_case.dart';
import 'package:vgv_coffee_machine/features/settings/ui/cubits/app_theme_cubit.dart';

import '../../../../test_utils/mocks.dart';

void main() {
  final GetSavedThemeModeUseCase getSavedThemeModeUseCase =
      GetSavedThemeModeUseCaseMock();
  final ChangeThemeModeUseCase changeThemeModeUseCase =
      ChangeThemeModeUseCaseMock();

  const initialState = Constants.defaultThemeMode;

  setUpAll(() {
    when(() => getSavedThemeModeUseCase())
        .thenReturn(const Right(Constants.defaultThemeMode));
  });

  AppThemeCubit prepareCubit() => AppThemeCubit(
        getSavedThemeModeUseCase,
        changeThemeModeUseCase,
      );

  test('Initial state', () {
    expect(prepareCubit().state, initialState);
  });

  group('changeThemeMode', () {
    test('should properly handle success case', () {
      final themeToChange = Constants.defaultThemeMode.opposite;

      testBloc<AppThemeCubit, CustomThemeMode>(
        build: prepareCubit,
        setUp: () {
          when(() => changeThemeModeUseCase(themeToChange))
              .thenAnswer((_) async => const Right(null));
        },
        act: (cubit) => cubit.changeThemeMode(themeToChange),
        expect: () => [
          themeToChange,
        ],
      );
    });
  });
}
