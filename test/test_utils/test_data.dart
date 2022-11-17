import 'package:vgv_coffee_machine/core/domain/models/coffee_image.dart';
import 'package:vgv_coffee_machine/core/errors/exceptions.dart';
import 'package:vgv_coffee_machine/core/errors/failure.dart';
import 'package:vgv_coffee_machine/features/settings/domain/models/custom_theme_mode.dart';

const tCoffeeImage = CoffeeImage(url: 'favourite_url1');

const List<CoffeeImage> tCoffeeImages = [
  CoffeeImage(url: 'url1'),
  CoffeeImage(url: 'url2'),
  CoffeeImage(url: 'url3'),
];

const tGeneralFailure = GeneralFailure('');

const tServerException = ServerException('');

const tCustomThemeMode = CustomThemeMode.light;
