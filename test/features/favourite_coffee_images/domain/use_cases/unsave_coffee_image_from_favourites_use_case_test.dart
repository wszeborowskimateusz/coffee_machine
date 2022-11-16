import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vgv_coffee_machine/core/extensions/list_extensions.dart';
import 'package:vgv_coffee_machine/features/favourite_coffee_images/domain/repositories/favourite_coffee_images_repository.dart';
import 'package:vgv_coffee_machine/features/favourite_coffee_images/domain/use_cases/unsave_coffee_image_from_favourites_use_case.dart';

import '../../../../test_utils/mocks.dart';
import '../../../../test_utils/test_data.dart';

void main() {
  final FavouriteCoffeeImagesRepository repositoryMock =
      FavouriteCoffeeImagesRepositoryMock();
  late final UnsaveCoffeeImageFromFavouritesUseCase useCase;

  setUpAll(() {
    useCase = UnsaveCoffeeImageFromFavouritesUseCase(repositoryMock);
  });

  test('Should properly handle failure when getting favourites list', () async {
    // Arrange
    when(() => repositoryMock.getFavouriteCoffeeImages())
        .thenReturn(const Left(tGeneralFailure));

    // Act
    final response = await useCase(tCoffeeImage);

    // Assert
    expect(response, const Left(tGeneralFailure));
    verify(() => repositoryMock.getFavouriteCoffeeImages()).called(1);
    verifyNever(() => repositoryMock.saveFavouriteCoffeeImages(captureAny()));
  });

  test('Should return success when image is not in favourites', () async {
    // Arrange
    when(() => repositoryMock.getFavouriteCoffeeImages())
        .thenReturn(const Right(tCoffeeImages));

    // Act
    final response = await useCase(tCoffeeImage);

    // Assert
    expect(response, const Right(null));
    verify(() => repositoryMock.getFavouriteCoffeeImages()).called(1);
    verifyNever(() => repositoryMock.saveFavouriteCoffeeImages(captureAny()));
  });

  test('Should properly call repository to save a new list of images',
      () async {
    // Arrange
    when(() => repositoryMock.getFavouriteCoffeeImages())
        .thenReturn(const Right(tCoffeeImages));
    when(() => repositoryMock.saveFavouriteCoffeeImages(captureAny()))
        .thenAnswer((_) async => const Right(null));

    // Act
    final response = await useCase(tCoffeeImages.first);

    // Assert
    expect(response, const Right(null));
    verify(() => repositoryMock.getFavouriteCoffeeImages()).called(1);
    final newList = tCoffeeImages.clone()..removeAt(0);
    verify(() => repositoryMock.saveFavouriteCoffeeImages(newList)).called(1);
  });
}
