import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vgv_coffee_machine/core/domain/models/coffee_image.dart';

part 'favourite_coffee_images_state.freezed.dart';

@freezed
class FavouriteCoffeeImagesState with _$FavouriteCoffeeImagesState {
  factory FavouriteCoffeeImagesState.loading() =
      _FavouriteCoffeeImagesLoadingState;

  factory FavouriteCoffeeImagesState.error() = _FavouriteCoffeeImagesErrorState;

  factory FavouriteCoffeeImagesState.loaded(List<CoffeeImage> images) =
      _FavouriteCoffeeImagesLoadedState;
}
