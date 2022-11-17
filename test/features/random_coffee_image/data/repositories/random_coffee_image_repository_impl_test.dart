import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vgv_coffee_machine/core/errors/failure.dart';
import 'package:vgv_coffee_machine/core/extensions/either_extensions.dart';
import 'package:vgv_coffee_machine/features/random_coffee_image/data/data_sources/random_coffee_image_remote_data_source.dart';
import 'package:vgv_coffee_machine/features/random_coffee_image/data/repositories/random_coffee_image_repository_impl.dart';
import 'package:vgv_coffee_machine/features/random_coffee_image/domain/repositories/random_coffee_image_repository.dart';

import '../../../../test_utils/mocks.dart';
import '../../../../test_utils/test_data.dart';

void main() {
  final RandomCoffeeImageRemoteDataSource remoteDataSourceMock =
      RandomCoffeeImageRemoteDataSourceMock();
  late final RandomCoffeeImageRepository repository;

  setUpAll(() {
    repository = RandomCoffeeImageRepositoryImpl(remoteDataSourceMock);
  });

  group('getRandomCoffeeImage', () {
    test('Should properly read value from remote data source', () async {
      // Arrange
      when(() => remoteDataSourceMock.getRandomCoffeeImage())
          .thenAnswer((_) async => tCoffeeImage);

      // Act
      final response = await repository.getRandomCoffeeImage();

      // Assert
      expect(response.isRight(), isTrue);
      expect(response.extractRight(), tCoffeeImage);
      verify(() => remoteDataSourceMock.getRandomCoffeeImage()).called(1);
    });

    test('Should properly react to server exception', () async {
      // Arrange
      when(() => remoteDataSourceMock.getRandomCoffeeImage())
          .thenThrow(tServerException);

      // Act
      final response = await repository.getRandomCoffeeImage();

      // Assert
      expect(response.isLeft(), isTrue);
      expect(response, const Left(ServerFailure('getRandomCoffeeImage')));
      verify(() => remoteDataSourceMock.getRandomCoffeeImage()).called(1);
    });

    test('Should return failure when remote source throws exception', () async {
      // Arrange
      when(() => remoteDataSourceMock.getRandomCoffeeImage()).thenThrow('');

      // Act
      final response = await repository.getRandomCoffeeImage();

      // Assert
      expect(response.isLeft(), isTrue);
      verify(() => remoteDataSourceMock.getRandomCoffeeImage()).called(1);
    });
  });
}
