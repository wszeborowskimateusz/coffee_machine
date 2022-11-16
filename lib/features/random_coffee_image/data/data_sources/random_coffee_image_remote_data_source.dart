import 'package:vgv_coffee_machine/core/domain/models/coffee_image.dart';

abstract class RandomCoffeeImageRemoteDataSource {
  Future<CoffeeImage> getRandomCoffeeImage();
}
