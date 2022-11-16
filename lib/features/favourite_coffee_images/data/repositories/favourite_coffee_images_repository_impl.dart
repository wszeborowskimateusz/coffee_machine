import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:vgv_coffee_machine/core/domain/models/coffee_image.dart';
import 'package:vgv_coffee_machine/core/errors/failure.dart';
import 'package:vgv_coffee_machine/features/favourite_coffee_images/data/data_sources/favourite_coffee_images_local_data_source.dart';
import 'package:vgv_coffee_machine/features/favourite_coffee_images/domain/repositories/favourite_coffee_images_repository.dart';

@LazySingleton(as: FavouriteCoffeeImagesRepository)
class FavouriteCoffeeImagesRepositoryImpl
    extends FavouriteCoffeeImagesRepository {
  final StreamController<List<CoffeeImage>>
      _favouritesCoffeeImagesStreamController =
      StreamController<List<CoffeeImage>>();

  final FavouriteCoffeeImagesLocalDataSource _localDataSource;

  FavouriteCoffeeImagesRepositoryImpl(this._localDataSource);

  @override
  Either<Failure, List<CoffeeImage>> getFavouriteCoffeeImages() {
    try {
      return Right(_localDataSource.getFavouriteCoffeeImages());
    } catch (e) {
      return Left(GeneralFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> saveFavouriteCoffeeImages(
    List<CoffeeImage> images,
  ) async {
    try {
      await _localDataSource.saveFavouriteCoffeeImages(images);
      _favouritesCoffeeImagesStreamController.sink.add(images);

      return const Right(null);
    } catch (e) {
      return Left(GeneralFailure(e.toString()));
    }
  }

  @override
  Stream<List<CoffeeImage>> getFavouriteCoffeeImagesStream() =>
      _favouritesCoffeeImagesStreamController.stream.asBroadcastStream();
}
