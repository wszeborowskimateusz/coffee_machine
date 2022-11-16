import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vgv_coffee_machine/core/ui/widgets/core_text.dart';

import '../../../test_utils/make_testable_widget.dart';

void main() {
  testWidgets(
    'Should properly display CoreText',
    (WidgetTester tester) async {
      const text = 'some text';
      final testableWidget = makeTestableWidget(CoreText.title(text));

      await tester.pumpWidget(testableWidget);
      await tester.pump();

      expect(find.byType(Text), findsOneWidget);
      expect(find.text(text), findsOneWidget);
    },
  );
}
