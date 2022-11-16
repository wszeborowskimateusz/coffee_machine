import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vgv_coffee_machine/core/domain/models/coffee_image.dart';
import 'package:vgv_coffee_machine/features/favourite_coffee_images/domain/use_cases/get_favourite_coffee_images_stream_use_case.dart';
import 'package:vgv_coffee_machine/features/favourite_coffee_images/domain/use_cases/get_favourite_coffee_images_use_case.dart';
import 'package:vgv_coffee_machine/features/favourite_coffee_images/domain/use_cases/unsave_coffee_image_from_favourites_use_case.dart';
import 'package:vgv_coffee_machine/features/favourite_coffee_images/ui/cubits/favourite_coffee_images_cubit.dart';
import 'package:vgv_coffee_machine/features/favourite_coffee_images/ui/cubits/favourite_coffee_images_state.dart';

import '../../../../test_utils/mocks.dart';
import '../../../../test_utils/test_data.dart';

void main() {
  final GetFavouriteCoffeeImagesUseCase getFavouriteCoffeeImagesUseCaseMock =
      GetFavouriteCoffeeImagesUseCaseMock();
  final UnsaveCoffeeImageFromFavouritesUseCase
      unsaveCoffeeImageFromFavouritesUseCaseMock =
      UnsaveCoffeeImageFromFavouritesUseCaseMock();
  final GetFavouriteCoffeeImagesStreamUseCase
      getFavouriteCoffeeImagesStreamUseCaseMock =
      GetFavouriteCoffeeImagesStreamUseCaseMock();

  final streamController = StreamController<List<CoffeeImage>>.broadcast();

  setUpAll(() {
    when(() => getFavouriteCoffeeImagesStreamUseCaseMock())
        .thenAnswer((_) => streamController.stream.asBroadcastStream());
  });

  FavouriteCoffeeImagesCubit prepareCubit() => FavouriteCoffeeImagesCubit(
        getFavouriteCoffeeImagesUseCaseMock,
        unsaveCoffeeImageFromFavouritesUseCaseMock,
        getFavouriteCoffeeImagesStreamUseCaseMock,
      );

  test('Initial state', () {
    expect(prepareCubit().state, FavouriteCoffeeImagesState.loading());
  });

  test('Should properly react to stream', () async {
    final cubit = prepareCubit();
    streamController.sink.add(tCoffeeImages);

    await expectLater(
      cubit.stream,
      emits(FavouriteCoffeeImagesState.loaded(tCoffeeImages)),
    );
  });

  group('getFavouriteCoffeeImages', () {
    test('should properly handle success case', () {
      testBloc<FavouriteCoffeeImagesCubit, FavouriteCoffeeImagesState>(
        build: prepareCubit,
        setUp: () {
          when(() => getFavouriteCoffeeImagesUseCaseMock())
              .thenAnswer((_) => const Right(tCoffeeImages));
        },
        act: (cubit) => cubit.getFavouriteCoffeeImages(),
        expect: () => [
          FavouriteCoffeeImagesState.loading(),
          FavouriteCoffeeImagesState.loaded(tCoffeeImages)
        ],
      );
    });

    test('should properly handle failure case', () {
      testBloc<FavouriteCoffeeImagesCubit, FavouriteCoffeeImagesState>(
        build: prepareCubit,
        setUp: () {
          when(() => getFavouriteCoffeeImagesUseCaseMock())
              .thenAnswer((_) => const Left(tGeneralFailure));
        },
        act: (cubit) => cubit.getFavouriteCoffeeImages(),
        expect: () => [
          FavouriteCoffeeImagesState.loading(),
          FavouriteCoffeeImagesState.error()
        ],
      );
    });
  });

  group('unsaveImageFromFavourites', () {
    test('should properly call the use case', () {
      testBloc<FavouriteCoffeeImagesCubit, FavouriteCoffeeImagesState>(
        build: prepareCubit,
        setUp: () {
          when(() => unsaveCoffeeImageFromFavouritesUseCaseMock(tCoffeeImage))
              .thenAnswer((_) async => const Right(null));
          when(() => getFavouriteCoffeeImagesUseCaseMock())
              .thenAnswer((_) => const Right(tCoffeeImages));
        },
        act: (cubit) => cubit.unsaveImageFromFavourites(tCoffeeImage),
        expect: () => [
          FavouriteCoffeeImagesState.loading(),
          FavouriteCoffeeImagesState.loaded(tCoffeeImages)
        ],
        verify: (_) {
          verify(() => unsaveCoffeeImageFromFavouritesUseCaseMock(tCoffeeImage))
              .called(1);
        },
      );
    });
  });
}
