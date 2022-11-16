import 'package:collection/collection.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vgv_coffee_machine/core/extensions/either_extensions.dart';
import 'package:vgv_coffee_machine/features/favourite_coffee_images/domain/repositories/favourite_coffee_images_repository.dart';
import 'package:vgv_coffee_machine/features/favourite_coffee_images/domain/use_cases/get_favourite_coffee_images_use_case.dart';

import '../../../../test_utils/mocks.dart';
import '../../../../test_utils/test_data.dart';

void main() {
  final FavouriteCoffeeImagesRepository repositoryMock =
      FavouriteCoffeeImagesRepositoryMock();
  late final GetFavouriteCoffeeImagesUseCase useCase;

  setUpAll(() {
    useCase = GetFavouriteCoffeeImagesUseCase(repositoryMock);
  });

  test('Should properly return right value from repository', () async {
    // Arrange
    when(() => repositoryMock.getFavouriteCoffeeImages())
        .thenReturn(const Right(tCoffeeImages));

    // Act
    final response = useCase();

    // Assert
    expect(response.isRight(), isTrue);
    expect(
      const ListEquality().equals(response.extractRight(), tCoffeeImages),
      isTrue,
    );
  });

  test('Should properly return left value from repository', () async {
    // Arrange
    when(() => repositoryMock.getFavouriteCoffeeImages())
        .thenReturn(const Left(tGeneralFailure));

    // Act
    final response = useCase();

    // Assert
    expect(response.isLeft(), isTrue);
    expect(response, const Left(tGeneralFailure));
  });
}
