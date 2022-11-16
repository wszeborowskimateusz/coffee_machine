import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:vgv_coffee_machine/core/domain/models/coffee_image.dart';
import 'package:vgv_coffee_machine/core/domain/use_case/use_case.dart';
import 'package:vgv_coffee_machine/core/errors/failure.dart';
import 'package:vgv_coffee_machine/features/random_coffee_image/domain/repositories/random_coffee_image_repository.dart';

@lazySingleton
class GetRandomCoffeeImageUseCase
    extends UseCase<Future<Either<Failure, CoffeeImage>>, NoParams?> {
  final RandomCoffeeImageRepository _repository;

  GetRandomCoffeeImageUseCase(this._repository);

  @override
  Future<Either<Failure, CoffeeImage>> call([NoParams? _]) =>
      _repository.getRandomCoffeeImage();
}
