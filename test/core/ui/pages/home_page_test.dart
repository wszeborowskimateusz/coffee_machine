import 'package:auto_route/auto_route.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:vgv_coffee_machine/core/constants/constants.dart';
import 'package:vgv_coffee_machine/core/dependency_injection/get_it.dart';
import 'package:vgv_coffee_machine/core/navigation/router.gr.dart';
import 'package:vgv_coffee_machine/features/random_coffee_image/ui/cubits/random_coffee_image_cubit.dart';
import 'package:vgv_coffee_machine/features/random_coffee_image/ui/cubits/random_coffee_image_state.dart';
import 'package:vgv_coffee_machine/features/random_coffee_image/ui/pages/random_coffee_image_page.dart';
import 'package:vgv_coffee_machine/features/settings/ui/cubits/app_theme_cubit.dart';

import '../../../test_utils/mocks.dart';

void main() {
  setUpAll(() {
    final cubitMock = RandomCoffeeImageCubitMock();
    getIt.registerFactory<RandomCoffeeImageCubit>(() => cubitMock);
    whenListen(
      cubitMock,
      Stream.fromIterable([RandomCoffeeImageState.initial()]),
      initialState: RandomCoffeeImageState.initial(),
    );
    when(() => cubitMock.generateNewRandomImages()).thenAnswer((_) async {});
  });

  testWidgets(
    'Should properly display home page',
    (WidgetTester tester) async {
      final appRouter = AppRouter();
      final appThemeCubit = AppThemeCubitMock();
      const themeMode = Constants.defaultThemeMode;
      whenListen(
        appThemeCubit,
        Stream.fromIterable([themeMode]),
        initialState: themeMode,
      );

      final testableWidget = BlocProvider<AppThemeCubit>(
        create: (_) => appThemeCubit,
        child: MaterialApp.router(
          locale: const Locale('en'),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          routerDelegate: appRouter.delegate(),
          routeInformationParser: appRouter.defaultRouteParser(),
        ),
      );

      await tester.pumpWidget(testableWidget);
      await tester.pump();

      expect(find.byType(AutoTabsScaffold), findsOneWidget);
      expect(find.byType(AppBar), findsOneWidget);
      expect(find.byType(SalomonBottomBar), findsOneWidget);
      expect(find.byType(RandomCoffeeImagePage), findsOneWidget);
    },
  );
}
