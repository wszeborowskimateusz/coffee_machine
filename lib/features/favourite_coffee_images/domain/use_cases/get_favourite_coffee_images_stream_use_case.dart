import 'package:injectable/injectable.dart';
import 'package:vgv_coffee_machine/core/domain/models/coffee_image.dart';
import 'package:vgv_coffee_machine/core/domain/use_case/use_case.dart';
import 'package:vgv_coffee_machine/features/favourite_coffee_images/domain/repositories/favourite_coffee_images_repository.dart';

@lazySingleton
class GetFavouriteCoffeeImagesStreamUseCase
    extends UseCase<Stream<List<CoffeeImage>>, NoParams?> {
  final FavouriteCoffeeImagesRepository _repository;

  GetFavouriteCoffeeImagesStreamUseCase(this._repository);

  @override
  Stream<List<CoffeeImage>> call([NoParams? _]) =>
      _repository.getFavouriteCoffeeImagesStream();
}
