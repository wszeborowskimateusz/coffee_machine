import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vgv_coffee_machine/core/local_storage/local_storage_service.dart';
import 'package:vgv_coffee_machine/core/local_storage/local_storage_service_keys.dart';
import 'package:vgv_coffee_machine/features/favourite_coffee_images/data/data_sources/favourite_coffee_images_local_data_source.dart';
import 'package:vgv_coffee_machine/features/favourite_coffee_images/data/data_sources/favourite_coffee_images_local_data_source_impl.dart';

import '../../../../test_utils/mocks.dart';
import '../../../../test_utils/test_data.dart';

void main() {
  final String key = LocalStorageServiceKeys.favouriteCoffeeImages;

  final LocalStorageService localStorageServiceMock = LocalStorageServiceMock();
  late final FavouriteCoffeeImagesLocalDataSource dataSource;

  setUpAll(() {
    dataSource =
        FavouriteCoffeeImagesLocalDataSourceImpl(localStorageServiceMock);
  });

  group('getFavouriteCoffeeImages', () {
    test('Should properly read value from storage', () {
      // Arrange
      when(() => localStorageServiceMock.getStringList(key))
          .thenReturn(tCoffeeImages.map((e) => json.encode(e)).toList());

      // Act
      final response = dataSource.getFavouriteCoffeeImages();

      // Assert
      expect(const ListEquality().equals(response, tCoffeeImages), isTrue);
      verify(() => localStorageServiceMock.getStringList(key)).called(1);
    });

    test('Should return empty when key is not present in local storage', () {
      // Arrange
      when(() => localStorageServiceMock.getStringList(key)).thenReturn(null);

      // Act
      final response = dataSource.getFavouriteCoffeeImages();

      // Assert
      expect(response, []);
      verify(() => localStorageServiceMock.getStringList(key)).called(1);
    });
  });

  group('saveFavouriteCoffeeImages', () {
    test('Should properly call the local storage service', () async {
      // Arrange
      final encodedList =
          tCoffeeImages.map((e) => json.encode(e.toJson())).toList();

      when(() => localStorageServiceMock.saveStringList(key, encodedList))
          .thenAnswer((_) async => true);

      // Act
      await dataSource.saveFavouriteCoffeeImages(tCoffeeImages);

      // Assert
      verify(() => localStorageServiceMock.saveStringList(key, encodedList))
          .called(1);
    });
  });
}
