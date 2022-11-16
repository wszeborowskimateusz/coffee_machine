import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:vgv_coffee_machine/core/domain/models/coffee_image.dart';
import 'package:vgv_coffee_machine/features/favourite_coffee_images/domain/use_cases/get_favourite_coffee_images_stream_use_case.dart';
import 'package:vgv_coffee_machine/features/favourite_coffee_images/domain/use_cases/get_favourite_coffee_images_use_case.dart';
import 'package:vgv_coffee_machine/features/favourite_coffee_images/domain/use_cases/unsave_coffee_image_from_favourites_use_case.dart';
import 'package:vgv_coffee_machine/features/favourite_coffee_images/ui/cubits/favourite_coffee_images_state.dart';

@injectable
class FavouriteCoffeeImagesCubit extends Cubit<FavouriteCoffeeImagesState> {
  final GetFavouriteCoffeeImagesUseCase _getFavouriteCoffeeImagesUseCase;
  final UnsaveCoffeeImageFromFavouritesUseCase
      _unsaveCoffeeImageFromFavouritesUseCase;
  final GetFavouriteCoffeeImagesStreamUseCase
      _getFavouriteCoffeeImagesStreamUseCase;

  late final StreamSubscription _streamSubscription;

  FavouriteCoffeeImagesCubit(
    this._getFavouriteCoffeeImagesUseCase,
    this._unsaveCoffeeImageFromFavouritesUseCase,
    this._getFavouriteCoffeeImagesStreamUseCase,
  ) : super(FavouriteCoffeeImagesState.loading()) {
    _streamSubscription = _getFavouriteCoffeeImagesStreamUseCase()
        .listen(_onUpdatedFavouritesCoffeeImages);
  }

  @override
  Future<void> close() async {
    await _streamSubscription.cancel();
    return super.close();
  }

  void _onUpdatedFavouritesCoffeeImages(List<CoffeeImage> images) {
    emit(FavouriteCoffeeImagesState.loaded(images));
  }

  void getFavouriteCoffeeImages() async {
    emit(FavouriteCoffeeImagesState.loading());

    final response = _getFavouriteCoffeeImagesUseCase();

    response.fold(
      (l) => emit(FavouriteCoffeeImagesState.error()),
      (images) => emit(FavouriteCoffeeImagesState.loaded(images)),
    );
  }

  Future<void> unsaveImageFromFavourites(CoffeeImage image) async {
    await _unsaveCoffeeImageFromFavouritesUseCase(image);

    getFavouriteCoffeeImages();
  }
}
