import 'package:dartz/dartz.dart';
import 'package:vgv_coffee_machine/core/domain/models/coffee_image.dart';
import 'package:vgv_coffee_machine/core/errors/failure.dart';

abstract class RandomCoffeeImageRepository {
  Future<Either<Failure, CoffeeImage>> getRandomCoffeeImage();
}
