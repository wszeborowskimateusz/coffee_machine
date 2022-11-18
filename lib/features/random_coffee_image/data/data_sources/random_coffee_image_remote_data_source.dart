import 'package:vgv_coffee_machine/core/domain/models/coffee_image.dart';

abstract class RandomCoffeeImageRemoteDataSource {
  /// Returns random coffee image from API
  Future<CoffeeImage> getRandomCoffeeImage();
}
