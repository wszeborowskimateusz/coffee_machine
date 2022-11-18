import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:vgv_coffee_machine/core/constants/constants.dart';
import 'package:vgv_coffee_machine/features/settings/ui/cubits/app_theme_cubit.dart';

import 'mocks.dart';

/// Prepares the [widget] by wrapping it with necessary widgets
/// like [MaterialApp]. Also provides translations and [AppThemeCubit]
Widget makeTestableWidget(Widget widget) {
  final appThemeCubit = AppThemeCubitMock();
  const themeMode = Constants.defaultThemeMode;
  whenListen(
    appThemeCubit,
    Stream.fromIterable([themeMode]),
    initialState: themeMode,
  );

  return MaterialApp(
    locale: const Locale('en'),
    localizationsDelegates: AppLocalizations.localizationsDelegates,
    supportedLocales: AppLocalizations.supportedLocales,
    home: BlocProvider<AppThemeCubit>(
      create: (_) => appThemeCubit,
      child: Material(child: widget),
    ),
  );
}
