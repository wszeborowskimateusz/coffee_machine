import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:vgv_coffee_machine/core/dependency_injection/get_it.dart';
import 'package:vgv_coffee_machine/core/logging/log.dart';
import 'package:vgv_coffee_machine/core/navigation/router.gr.dart';
import 'package:vgv_coffee_machine/core/ui/cubits/app_bloc_observer.dart';
import 'package:vgv_coffee_machine/core/ui/widgets/cubit_widget.dart';
import 'package:vgv_coffee_machine/features/settings/domain/models/custom_theme_mode.dart';
import 'package:vgv_coffee_machine/features/settings/ui/cubits/app_theme_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();

  Log.init();

  FlutterError.onError = (details) {
    Log.error(details.exceptionAsString(), details.exception, details.stack);
  };

  Bloc.observer = AppBlocObserver();

  await runZonedGuarded(
    () async => runApp(CoffeeMachineApp()),
    (error, stackTrace) => Log.error(error.toString(), error, stackTrace),
  );
}

class CoffeeMachineApp extends CubitWidget<AppThemeCubit, CustomThemeMode> {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context, _, CustomThemeMode themeMode, __) {
    return MaterialApp.router(
      title: 'Coffee Machine',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
      themeMode: themeMode.themeMode,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
    );
  }
}
