import 'package:dartz/dartz.dart';
import 'package:vgv_coffee_machine/core/domain/models/coffee_image.dart';
import 'package:vgv_coffee_machine/core/errors/failure.dart';

abstract class FavouriteCoffeeImagesRepository {
  Either<Failure, List<CoffeeImage>> getFavouriteCoffeeImages();

  Future<Either<Failure, void>> saveFavouriteCoffeeImages(
    List<CoffeeImage> images,
  );

  /// Returns a stream of favourite coffee images
  /// Stream adds the data on any update to the list while the app is running
  /// It will NOT add data in the start of the app. To fetch the data during start
  /// use [getFavouriteCoffeeImages] method
  Stream<List<CoffeeImage>> getFavouriteCoffeeImagesStream();
}
