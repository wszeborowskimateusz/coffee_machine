import 'package:vgv_coffee_machine/core/domain/models/coffee_image.dart';

abstract class FavouriteCoffeeImagesLocalDataSource {
  List<CoffeeImage> getFavouriteCoffeeImages();

  Future<void> saveFavouriteCoffeeImages(List<CoffeeImage> images);
}
