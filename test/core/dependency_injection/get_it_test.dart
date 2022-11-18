import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vgv_coffee_machine/core/dependency_injection/get_it.dart';

void main() {
  test('Should register dependencies without error', () async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences.setMockInitialValues({});

    final response = await configureDependencies();

    expect(response, isNotNull);
  });
}
