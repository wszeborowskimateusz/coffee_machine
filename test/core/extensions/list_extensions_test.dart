import 'package:collection/collection.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vgv_coffee_machine/core/extensions/list_extensions.dart';

void main() {
  group('clone', () {
    test('Should properly clone the list', () {
      final list = [1, 2, 3];
      final clone = list.clone();
      expect(identical(list, clone), isFalse);
      expect(const ListEquality().equals(list, clone), isTrue);
    });
  });
}
