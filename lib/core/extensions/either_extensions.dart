import 'package:dartz/dartz.dart';

extension EitherExtensions<L, R> on Either<L, R> {
  R extractRight() => (this as Right).value;
}
