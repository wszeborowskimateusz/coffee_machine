import 'package:dartz/dartz.dart';
import 'package:vgv_coffee_machine/core/domain/models/coffee_image.dart';
import 'package:vgv_coffee_machine/core/errors/failure.dart';

abstract class FavouriteCoffeeImagesRepository {
  Either<Failure, List<CoffeeImage>> getFavouriteCoffeeImages();

  Future<Either<Failure, void>> saveFavouriteCoffeeImages(
    List<CoffeeImage> images,
  );

  Stream<List<CoffeeImage>> getFavouriteCoffeeImagesStream();
}
