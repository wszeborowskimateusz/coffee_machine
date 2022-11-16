import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vgv_coffee_machine/core/ui/core_icons.dart';
import 'package:vgv_coffee_machine/core/ui/widgets/coffee_image_widget.dart';
import 'package:vgv_coffee_machine/features/favourite_coffee_images/ui/widgets/favourite_coffee_image_widget.dart';

import '../../../../test_utils/make_testable_widget.dart';

void main() {
  testWidgets(
    'Should properly display favourite coffee image',
    (WidgetTester tester) async {
      final testableWidget = makeTestableWidget(FavouriteCoffeeImageWidget(
        imageUrl: '',
        onUnsave: () {},
      ));
      await tester.pumpWidget(testableWidget);
      await tester.pump();

      expect(find.byType(Stack), findsOneWidget);
      expect(find.byType(CoffeeImageWidget), findsOneWidget);
      expect(find.byType(IconButton), findsOneWidget);
      expect(find.byIcon(CoreIcons.unFavourite), findsOneWidget);
    },
  );
}
