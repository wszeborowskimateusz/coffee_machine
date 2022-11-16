import 'package:collection/collection.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vgv_coffee_machine/core/extensions/either_extensions.dart';
import 'package:vgv_coffee_machine/features/favourite_coffee_images/data/data_sources/favourite_coffee_images_local_data_source.dart';
import 'package:vgv_coffee_machine/features/favourite_coffee_images/data/repositories/favourite_coffee_images_repository_impl.dart';
import 'package:vgv_coffee_machine/features/favourite_coffee_images/domain/repositories/favourite_coffee_images_repository.dart';

import '../../../../test_utils/mocks.dart';
import '../../../../test_utils/test_data.dart';

void main() {
  final FavouriteCoffeeImagesLocalDataSource localDataSourceMock =
      FavouriteCoffeeImagesLocalDataSourceMock();
  late final FavouriteCoffeeImagesRepository repository;

  setUpAll(() {
    repository = FavouriteCoffeeImagesRepositoryImpl(localDataSourceMock);
  });

  group('getFavouriteCoffeeImages', () {
    test('Should properly read value from local storage', () {
      // Arrange
      when(() => localDataSourceMock.getFavouriteCoffeeImages())
          .thenReturn(tCoffeeImages);

      // Act
      final response = repository.getFavouriteCoffeeImages();

      // Assert
      expect(response.isRight(), isTrue);
      expect(
        const ListEquality().equals(response.extractRight(), tCoffeeImages),
        isTrue,
      );
      verify(() => localDataSourceMock.getFavouriteCoffeeImages()).called(1);
    });

    test('Should return failure when local storage throws exception', () {
      // Arrange
      when(() => localDataSourceMock.getFavouriteCoffeeImages()).thenThrow('');

      // Act
      final response = repository.getFavouriteCoffeeImages();

      // Assert
      expect(response.isLeft(), isTrue);
      verify(() => localDataSourceMock.getFavouriteCoffeeImages()).called(1);
    });
  });

  group('saveFavouriteCoffeeImages', () {
    test('Should properly write value to local storage', () async {
      // Arrange
      when(() => localDataSourceMock.saveFavouriteCoffeeImages(tCoffeeImages))
          .thenAnswer((_) async {});

      // Act
      final response =
          await repository.saveFavouriteCoffeeImages(tCoffeeImages);

      // Assert
      expect(response.isRight(), isTrue);
      verify(() => localDataSourceMock.saveFavouriteCoffeeImages(tCoffeeImages))
          .called(1);
    });

    test('Should return failure when local storage throws exception', () async {
      // Arrange
      when(() => localDataSourceMock.saveFavouriteCoffeeImages(tCoffeeImages))
          .thenThrow('');

      // Act
      final response =
          await repository.saveFavouriteCoffeeImages(tCoffeeImages);

      // Assert
      expect(response.isLeft(), isTrue);
      verify(() => localDataSourceMock.saveFavouriteCoffeeImages(tCoffeeImages))
          .called(1);
    });
  });

  group('getFavouriteCoffeeImagesStream', () {
    test('Should properly return stream', () async {
      // Arrange
      when(() => localDataSourceMock.saveFavouriteCoffeeImages(tCoffeeImages))
          .thenAnswer((_) async {});

      // Act
      final stream = repository.getFavouriteCoffeeImagesStream();

      await repository.saveFavouriteCoffeeImages(tCoffeeImages);

      // Assert
      await expectLater(stream, emits(tCoffeeImages));
    });
  });
}
