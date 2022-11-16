import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:vgv_coffee_machine/core/domain/models/coffee_image.dart';
import 'package:vgv_coffee_machine/core/domain/use_case/use_case.dart';
import 'package:vgv_coffee_machine/core/errors/failure.dart';
import 'package:vgv_coffee_machine/core/extensions/list_extensions.dart';
import 'package:vgv_coffee_machine/features/favourite_coffee_images/domain/repositories/favourite_coffee_images_repository.dart';

@lazySingleton
class UnsaveCoffeeImageFromFavouritesUseCase
    extends UseCase<Future<Either<Failure, void>>, CoffeeImage> {
  final FavouriteCoffeeImagesRepository _repository;

  UnsaveCoffeeImageFromFavouritesUseCase(this._repository);

  @override
  Future<Either<Failure, void>> call(CoffeeImage image) async {
    final currentFavouriteImagesResponse =
        _repository.getFavouriteCoffeeImages();

    return currentFavouriteImagesResponse.fold(
      (l) => Left(l),
      (currentFavouriteImages) {
        if (!currentFavouriteImages.contains(image)) {
          return const Right(null);
        }

        final newFavouritesList = currentFavouriteImages.clone()..remove(image);

        return _repository.saveFavouriteCoffeeImages(newFavouritesList);
      },
    );
  }
}
