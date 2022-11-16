import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vgv_coffee_machine/core/errors/exceptions.dart';
import 'package:vgv_coffee_machine/features/random_coffee_image/data/data_sources/random_coffee_image_remote_data_source.dart';
import 'package:vgv_coffee_machine/features/random_coffee_image/data/data_sources/random_coffee_image_remote_data_source_impl.dart';

import '../../../../test_utils/mocks.dart';
import '../../../../test_utils/test_data.dart';

void main() {
  final Dio dioMock = DioMock();
  late final RandomCoffeeImageRemoteDataSource dataSource;

  setUpAll(() {
    dataSource = RandomCoffeeImageRemoteDataSourceImpl(dioMock);
  });

  group('getRandomCoffeeImage', () {
    test('Should properly parse dio response', () async {
      // Arrange
      when(() => dioMock.get(captureAny())).thenAnswer(
        (_) async => Response(
          requestOptions: RequestOptions(path: ''),
          data: tCoffeeImage.toJson(),
        ),
      );

      // Act
      final response = await dataSource.getRandomCoffeeImage();

      // Assert
      expect(response, tCoffeeImage);
    });

    test('Should return error in case of error from dio', () async {
      // Arrange
      when(() => dioMock.get(captureAny())).thenThrow(
        DioError(requestOptions: RequestOptions(path: '')),
      );

      // Act
      final response = dataSource.getRandomCoffeeImage();

      // Assert
      expect(response, throwsA(isA<ServerException>()));
    });
  });
}
