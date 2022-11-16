import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:vgv_coffee_machine/core/domain/models/coffee_image.dart';
import 'package:vgv_coffee_machine/core/errors/exceptions.dart';
import 'package:vgv_coffee_machine/core/errors/failure.dart';
import 'package:vgv_coffee_machine/features/random_coffee_image/data/data_sources/random_coffee_image_remote_data_source.dart';
import 'package:vgv_coffee_machine/features/random_coffee_image/domain/repositories/random_coffee_image_repository.dart';

@Singleton(as: RandomCoffeeImageRepository)
class RandomCoffeeImageRepositoryImpl extends RandomCoffeeImageRepository {
  final RandomCoffeeImageRemoteDataSource _remoteDataSource;

  RandomCoffeeImageRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, CoffeeImage>> getRandomCoffeeImage() async {
    try {
      return Right(await _remoteDataSource.getRandomCoffeeImage());
    } on ServerException catch (_) {
      return const Left(ServerFailure('getRandomCoffeeImage'));
    } catch (e) {
      return Left(GeneralFailure(e.toString()));
    }
  }
}
