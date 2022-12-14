import 'package:flutter_test/flutter_test.dart';
import 'package:vgv_coffee_machine/main.dart' as app;

extension WidgetTesterExtensions on WidgetTester {
  /// Runs the whole app and does the pump
  /// Used in integration / E2E tests
  Future<void> pumpApp() async {
    await app.main();
    await pumpAndSettle();
  }

  Future<void> tapAndPump(Finder finder) async {
    await tap(finder);
    await pumpAndSettle();
  }
}
