import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vgv_coffee_machine/core/extensions/either_extensions.dart';
import 'package:vgv_coffee_machine/features/random_coffee_image/domain/repositories/random_coffee_image_repository.dart';
import 'package:vgv_coffee_machine/features/random_coffee_image/domain/use_cases/get_random_coffee_image_use_case.dart';

import '../../../../test_utils/mocks.dart';
import '../../../../test_utils/test_data.dart';

void main() {
  final RandomCoffeeImageRepository repositoryMock =
      RandomCoffeeImageRepositoryMock();
  late final GetRandomCoffeeImageUseCase useCase;

  setUpAll(() {
    useCase = GetRandomCoffeeImageUseCase(repositoryMock);
  });

  test('Should properly return right value from repository', () async {
    // Arrange
    when(() => repositoryMock.getRandomCoffeeImage())
        .thenAnswer((_) async => const Right(tCoffeeImage));

    // Act
    final response = await useCase();

    // Assert
    expect(response.isRight(), isTrue);
    expect(response.extractRight(), tCoffeeImage);
  });

  test('Should properly return left value from repository', () async {
    // Arrange
    when(() => repositoryMock.getRandomCoffeeImage())
        .thenAnswer((_) async => const Left(tGeneralFailure));

    // Act
    final response = await useCase();

    // Assert
    expect(response.isLeft(), isTrue);
    expect(response, const Left(tGeneralFailure));
  });
}
