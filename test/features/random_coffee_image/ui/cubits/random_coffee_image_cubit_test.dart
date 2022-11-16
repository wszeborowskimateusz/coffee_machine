import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vgv_coffee_machine/features/favourite_coffee_images/domain/use_cases/save_coffee_image_as_favourite_use_case.dart';
import 'package:vgv_coffee_machine/features/random_coffee_image/domain/use_cases/get_random_coffee_image_use_case.dart';
import 'package:vgv_coffee_machine/features/random_coffee_image/ui/cubits/random_coffee_image_cubit.dart';
import 'package:vgv_coffee_machine/features/random_coffee_image/ui/cubits/random_coffee_image_state.dart';

import '../../../../test_utils/mocks.dart';
import '../../../../test_utils/test_data.dart';

void main() {
  final GetRandomCoffeeImageUseCase getRandomCoffeeImageUseCase =
      GetRandomCoffeeImageUseCaseMock();
  final SaveCoffeeImageAsFavouriteUseCase
      saveCoffeeImageAsFavouriteUseCaseMock =
      SaveCoffeeImageAsFavouriteUseCaseMock();

  final initialState = RandomCoffeeImageState.initial();

  RandomCoffeeImageCubit prepareCubit() => RandomCoffeeImageCubit(
        getRandomCoffeeImageUseCase,
        saveCoffeeImageAsFavouriteUseCaseMock,
      );

  test('Initial state', () {
    expect(prepareCubit().state, initialState);
  });

  group('generateNewRandomImages', () {
    test('should properly handle success case', () {
      final images = List.generate(
        RandomCoffeeImageCubit.numberOfImagesPerFetch,
        (index) => tCoffeeImage,
      );

      testBloc<RandomCoffeeImageCubit, RandomCoffeeImageState>(
        build: prepareCubit,
        setUp: () {
          when(() => getRandomCoffeeImageUseCase())
              .thenAnswer((_) async => const Right(tCoffeeImage));
        },
        act: (cubit) => cubit.generateNewRandomImages(),
        expect: () => [
          initialState.copyWith(status: RandomCoffeeImageStatus.loading),
          const TypeMatcher<RandomCoffeeImageState>()
              .having(
                (state) => state.status,
                'status',
                RandomCoffeeImageStatus.loaded,
              )
              .having(
                (state) => state.randomCoffeeImages,
                'randomCoffeeImages',
                images,
              ),
        ],
      );
    });

    test('should properly handle all the images being failed', () {
      testBloc<RandomCoffeeImageCubit, RandomCoffeeImageState>(
        build: prepareCubit,
        setUp: () {
          when(() => getRandomCoffeeImageUseCase())
              .thenAnswer((_) async => const Left(tGeneralFailure));
        },
        act: (cubit) => cubit.generateNewRandomImages(),
        expect: () => [
          initialState.copyWith(status: RandomCoffeeImageStatus.loading),
          initialState.copyWith(status: RandomCoffeeImageStatus.error),
        ],
      );
    });
  });

  group('saveImageAsFavourite', () {
    test('should properly handle success case', () {
      testBloc<RandomCoffeeImageCubit, RandomCoffeeImageState>(
        build: prepareCubit,
        setUp: () {
          when(() => saveCoffeeImageAsFavouriteUseCaseMock(tCoffeeImage))
              .thenAnswer((_) async => const Right(null));
        },
        act: (cubit) => cubit.saveImageAsFavourite(tCoffeeImage),
        expect: () => [
          initialState.copyWith(
            savingToFavouriteState: SavingToFavouriteState.saved,
          ),
        ],
      );
    });

    test('should properly handle failure case', () {
      testBloc<RandomCoffeeImageCubit, RandomCoffeeImageState>(
        build: prepareCubit,
        setUp: () {
          when(() => saveCoffeeImageAsFavouriteUseCaseMock(tCoffeeImage))
              .thenAnswer((_) async => const Left(tGeneralFailure));
        },
        act: (cubit) => cubit.saveImageAsFavourite(tCoffeeImage),
        expect: () => [
          initialState.copyWith(
            savingToFavouriteState: SavingToFavouriteState.error,
          ),
        ],
      );
    });
  });
}
