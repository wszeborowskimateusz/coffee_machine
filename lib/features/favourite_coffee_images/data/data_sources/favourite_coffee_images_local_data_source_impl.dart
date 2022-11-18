import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:vgv_coffee_machine/core/domain/models/coffee_image.dart';
import 'package:vgv_coffee_machine/core/local_storage/local_storage_service.dart';
import 'package:vgv_coffee_machine/core/local_storage/local_storage_service_keys.dart';
import 'package:vgv_coffee_machine/features/favourite_coffee_images/data/data_sources/favourite_coffee_images_local_data_source.dart';

@LazySingleton(as: FavouriteCoffeeImagesLocalDataSource)
class FavouriteCoffeeImagesLocalDataSourceImpl
    extends FavouriteCoffeeImagesLocalDataSource {
  final LocalStorageService _localStorageService;

  FavouriteCoffeeImagesLocalDataSourceImpl(this._localStorageService);

  @override
  List<CoffeeImage> getFavouriteCoffeeImages() {
    final storageValue = _localStorageService
        .getStringList(LocalStorageServiceKeys.favouriteCoffeeImages);

    if (storageValue == null) {
      return [];
    }

    return storageValue
        .map((e) => CoffeeImage.fromJson(json.decode(e)))
        .toList();
  }

  @override
  Future<void> saveFavouriteCoffeeImages(List<CoffeeImage> images) async {
    final valueToStore = images.map((e) => json.encode(e.toJson())).toList();

    await _localStorageService.saveStringList(
      LocalStorageServiceKeys.favouriteCoffeeImages,
      valueToStore,
    );
  }
}
