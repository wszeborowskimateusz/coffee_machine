import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vgv_coffee_machine/core/domain/models/coffee_image.dart';
import 'package:vgv_coffee_machine/features/favourite_coffee_images/domain/repositories/favourite_coffee_images_repository.dart';
import 'package:vgv_coffee_machine/features/favourite_coffee_images/domain/use_cases/get_favourite_coffee_images_stream_use_case.dart';

import '../../../../test_utils/mocks.dart';
import '../../../../test_utils/test_data.dart';

void main() {
  final FavouriteCoffeeImagesRepository repositoryMock =
      FavouriteCoffeeImagesRepositoryMock();
  late final GetFavouriteCoffeeImagesStreamUseCase useCase;

  setUpAll(() {
    useCase = GetFavouriteCoffeeImagesStreamUseCase(repositoryMock);
  });

  test('Should properly return stream', () async {
    // Arrange
    final controller = StreamController<List<CoffeeImage>>();
    final stream = controller.stream.asBroadcastStream();
    when(() => repositoryMock.getFavouriteCoffeeImagesStream())
        .thenAnswer((_) => stream);

    // Act
    final response = useCase();
    controller.sink.add(tCoffeeImages);

    // Assert
    await expectLater(response, emits(tCoffeeImages));
  });
}
