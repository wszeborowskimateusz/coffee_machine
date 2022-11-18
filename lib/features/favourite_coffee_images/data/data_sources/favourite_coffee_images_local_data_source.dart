import 'package:vgv_coffee_machine/core/domain/models/coffee_image.dart';

abstract class FavouriteCoffeeImagesLocalDataSource {
  /// Fetches favourite coffee images from local storage
  /// Returns empty list when no images are saved
  List<CoffeeImage> getFavouriteCoffeeImages();

  /// Saves favourite images to local storage overriding any existing ones
  Future<void> saveFavouriteCoffeeImages(List<CoffeeImage> images);
}
