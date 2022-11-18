import 'package:injectable/injectable.dart';
import 'package:vgv_coffee_machine/core/dependency_injection/get_it.dart';
import 'package:vgv_coffee_machine/core/environment/dart_defines.dart';

enum Environment { dev, prod }

@singleton
class EnvironmentConfig {
  static const String environmentProdString = 'PROD';
  static const String environmentDevString = 'DEV';

  final Environment currentEnvironment;

  const EnvironmentConfig(this.currentEnvironment);

  @factoryMethod
  factory EnvironmentConfig.init() {
    return EnvironmentConfig(_extractCurrentEnvironmentFromDartDefine());
  }

  static Environment _extractCurrentEnvironmentFromDartDefine() {
    final envString = getIt<DartDefines>().environment;
    switch (envString) {
      case environmentDevString:
        return Environment.dev;
      case environmentProdString:
        return Environment.prod;
      default:
        throw ArgumentError(
          'Following environment: $envString is not supported',
        );
    }
  }

  bool get isDev => currentEnvironment == Environment.dev;

  bool get isProd => currentEnvironment == Environment.prod;
}
