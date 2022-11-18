import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vgv_coffee_machine/core/constants/constants.dart';
import 'package:vgv_coffee_machine/core/dependency_injection/get_it.dart';
import 'package:vgv_coffee_machine/core/ui/core_icons.dart';
import 'package:vgv_coffee_machine/features/settings/ui/cubits/app_theme_cubit.dart';
import 'package:vgv_coffee_machine/features/settings/ui/pages/settings_page.dart';

import '../../../../test_utils/make_testable_widget.dart';
import '../../../../test_utils/mocks.dart';
import '../../../../test_utils/test_translations_getter.dart';

void main() {
  setUpAll(() {
    final cubitMock = AppThemeCubitMock();

    getIt.registerSingleton<AppThemeCubit>(cubitMock);
    whenListen(
      cubitMock,
      Stream.fromIterable([Constants.defaultThemeMode]),
      initialState: Constants.defaultThemeMode,
    );
  });

  testWidgets(
    'Should properly display settings page',
    (WidgetTester tester) async {
      await tester.pumpWidget(makeTestableWidget(const SettingsPage()));
      await tester.pump();

      expect(find.byType(ElevatedButton), findsOneWidget);
      expect(find.byIcon(CoreIcons.lightMode), findsOneWidget);
      expect(find.text(testTranslations.changeTheme), findsOneWidget);
    },
  );
}
