import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swipe_cards/swipe_cards.dart';
import 'package:vgv_coffee_machine/core/domain/models/coffee_image.dart';

part 'random_coffee_image_state.freezed.dart';

enum RandomCoffeeImageStatus { loading, error, loaded }

enum SavingToFavouriteState { idle, saved, error }

@freezed
class RandomCoffeeImageState with _$RandomCoffeeImageState {
  const factory RandomCoffeeImageState({
    required RandomCoffeeImageStatus status,
    required SavingToFavouriteState savingToFavouriteState,
    MatchEngine? matchEngine,
    List<CoffeeImage>? randomCoffeeImages,
  }) = _RandomCoffeeImageState;

  factory RandomCoffeeImageState.initial() => const RandomCoffeeImageState(
        status: RandomCoffeeImageStatus.loading,
        savingToFavouriteState: SavingToFavouriteState.idle,
      );
}
