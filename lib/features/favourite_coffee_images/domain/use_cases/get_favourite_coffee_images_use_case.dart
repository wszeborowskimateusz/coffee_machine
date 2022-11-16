import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:vgv_coffee_machine/core/domain/models/coffee_image.dart';
import 'package:vgv_coffee_machine/core/domain/use_case/use_case.dart';
import 'package:vgv_coffee_machine/core/errors/failure.dart';
import 'package:vgv_coffee_machine/features/favourite_coffee_images/domain/repositories/favourite_coffee_images_repository.dart';

@lazySingleton
class GetFavouriteCoffeeImagesUseCase
    extends UseCase<Either<Failure, List<CoffeeImage>>, NoParams?> {
  final FavouriteCoffeeImagesRepository _repository;

  GetFavouriteCoffeeImagesUseCase(this._repository);

  @override
  Either<Failure, List<CoffeeImage>> call([NoParams? _]) =>
      _repository.getFavouriteCoffeeImages();
}
