import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:vgv_coffee_machine/core/domain/models/coffee_image.dart';
import 'package:vgv_coffee_machine/core/endpoints/endpoints.dart';
import 'package:vgv_coffee_machine/core/errors/exceptions.dart';
import 'package:vgv_coffee_machine/features/random_coffee_image/data/data_sources/random_coffee_image_remote_data_source.dart';

@LazySingleton(as: RandomCoffeeImageRemoteDataSource)
class RandomCoffeeImageRemoteDataSourceImpl
    extends RandomCoffeeImageRemoteDataSource {
  final Dio _dio;

  RandomCoffeeImageRemoteDataSourceImpl(this._dio);

  @override
  Future<CoffeeImage> getRandomCoffeeImage() async {
    try {
      final result = await _dio.get(Endpoints.randomCoffeeImage);

      final CoffeeImage coffeeImage = CoffeeImage.fromJson(result.data);

      return coffeeImage;
    } on DioError catch (e) {
      throw ServerException(e.toString());
    }
  }
}
