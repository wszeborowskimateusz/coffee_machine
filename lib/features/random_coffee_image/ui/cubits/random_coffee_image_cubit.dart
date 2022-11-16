import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:swipe_cards/swipe_cards.dart';
import 'package:vgv_coffee_machine/core/domain/models/coffee_image.dart';
import 'package:vgv_coffee_machine/core/extensions/either_extensions.dart';
import 'package:vgv_coffee_machine/features/favourite_coffee_images/domain/use_cases/save_coffee_image_as_favourite_use_case.dart';
import 'package:vgv_coffee_machine/features/random_coffee_image/domain/use_cases/get_random_coffee_image_use_case.dart';
import 'package:vgv_coffee_machine/features/random_coffee_image/ui/cubits/random_coffee_image_state.dart';

@injectable
class RandomCoffeeImageCubit extends Cubit<RandomCoffeeImageState> {
  @visibleForTesting
  static const int numberOfImagesPerFetch = 5;

  final GetRandomCoffeeImageUseCase _getRandomCoffeeImageUseCase;
  final SaveCoffeeImageAsFavouriteUseCase _saveCoffeeImageAsFavouriteUseCase;

  RandomCoffeeImageCubit(
    this._getRandomCoffeeImageUseCase,
    this._saveCoffeeImageAsFavouriteUseCase,
  ) : super(RandomCoffeeImageState.initial());

  @override
  Future<void> close() {
    _disposeMatchEngineIfPresent();
    return super.close();
  }

  Future<void> generateNewRandomImages() async {
    _disposeMatchEngineIfPresent();

    emit(state.copyWith(status: RandomCoffeeImageStatus.loading));

    final response = await Future.wait(
      List.generate(
        numberOfImagesPerFetch,
        (_) => _getRandomCoffeeImageUseCase(),
      ),
    );

    if (response.every((imageResponse) => imageResponse.isLeft())) {
      emit(state.copyWith(status: RandomCoffeeImageStatus.error));
      return;
    }

    final images = response
        .where((imageResponse) => imageResponse.isRight())
        .map((imageResponse) => imageResponse.extractRight())
        .toList();

    final swipeItems = images
        .map(
          (image) => SwipeItem(
            content: image,
            likeAction: () => saveImageAsFavourite(image),
          ),
        )
        .toList();

    emit(
      state.copyWith(
        status: RandomCoffeeImageStatus.loaded,
        matchEngine: MatchEngine(swipeItems: swipeItems),
        randomCoffeeImages: images,
      ),
    );
  }

  @visibleForTesting
  Future<void> saveImageAsFavourite(CoffeeImage image) async {
    final response = await _saveCoffeeImageAsFavouriteUseCase(image);

    emit(
      state.copyWith(
        savingToFavouriteState: response.fold(
            (_) => SavingToFavouriteState.error,
            (_) => SavingToFavouriteState.saved),
      ),
    );
  }

  void clearSavingToFavouriteState() {
    emit(state.copyWith(savingToFavouriteState: SavingToFavouriteState.idle));
  }

  void _disposeMatchEngineIfPresent() {
    if (state.matchEngine != null) {
      state.matchEngine!.dispose();
    }
  }
}
