import 'package:dartz/dartz.dart';

extension EitherExtensions<L, R> on Either<L, R> {
  /// Extracts the right value if Either is Right
  /// Throws exception when Either is Left
  R extractRight() => (this as Right).value;
}
