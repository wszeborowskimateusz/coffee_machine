import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vgv_coffee_machine/core/ui/widgets/coffee_image_widget.dart';

import '../../../test_utils/make_testable_widget.dart';

void main() {
  testWidgets(
    'Should properly display coffee image',
    (WidgetTester tester) async {
      final testableWidget = makeTestableWidget(const CoffeeImageWidget('url'));

      await tester.pumpWidget(testableWidget);
      await tester.pump();

      expect(find.byType(CachedNetworkImage), findsOneWidget);
    },
  );
}
