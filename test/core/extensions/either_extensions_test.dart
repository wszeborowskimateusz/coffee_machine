import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vgv_coffee_machine/core/extensions/either_extensions.dart';

void main() {
  group('extractRight', () {
    test('Should extract the value if Either is Right', () {
      expect(const Right(1).extractRight(), 1);
      expect(const Right('a').extractRight(), 'a');
      expect(const Right(null).extractRight(), isNull);
    });

    test('Should throw exception if Either is Left', () {
      expect(() => const Left(1).extractRight(), throwsA(isA<TypeError>()));
      expect(() => const Left('a').extractRight(), throwsA(isA<TypeError>()));
      expect(() => const Left(null).extractRight(), throwsA(isA<TypeError>()));
    });
  });
}
