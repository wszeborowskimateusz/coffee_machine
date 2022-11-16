import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vgv_coffee_machine/core/ui/widgets/core_error_widget.dart';

import '../../../test_utils/make_testable_widget.dart';
import '../../../test_utils/test_translations_getter.dart';

void main() {
  testWidgets(
    'Should properly display error page without refresh button',
    (WidgetTester tester) async {
      final testableWidget = makeTestableWidget(const CoreErrorWidget());

      await tester.pumpWidget(testableWidget);
      await tester.pump();

      expect(find.byType(Icon), findsOneWidget);
      expect(find.text(testTranslations.coreErrorWidgetTitle), findsOneWidget);
      expect(find.byType(ElevatedButton), findsNothing);
    },
  );

  testWidgets(
    'Should properly display error page with refresh button',
    (WidgetTester tester) async {
      bool wasPressed = false;
      final testableWidget = makeTestableWidget(
        CoreErrorWidget(
          onRefresh: () {
            wasPressed = true;
          },
        ),
      );

      await tester.pumpWidget(testableWidget);
      await tester.pump();

      expect(find.byType(Icon), findsNWidgets(2));
      expect(find.text(testTranslations.coreErrorWidgetTitle), findsOneWidget);

      final refreshButton = find.byType(ElevatedButton);
      expect(refreshButton, findsOneWidget);

      await tester.tap(refreshButton);
      await tester.pump();

      expect(wasPressed, isTrue);
    },
  );
}
