import 'package:injectable/injectable.dart';
import 'package:vgv_coffee_machine/core/constants/constants.dart';
import 'package:vgv_coffee_machine/core/environment/dart_defines.dart';
import 'package:vgv_coffee_machine/core/services/dependency_injection/get_it.dart';

enum Environment { dev, prod }

@singleton
class EnvironmentConfig {
  final Environment currentEnvironment;

  const EnvironmentConfig(this.currentEnvironment);

  @factoryMethod
  factory EnvironmentConfig.init() {
    return EnvironmentConfig(_extractCurrentEnvironmentFromDartDefine());
  }

  static Environment _extractCurrentEnvironmentFromDartDefine() {
    final envString = getIt<DartDefines>().environment;
    switch (envString) {
      case Constants.environmentDev:
        return Environment.dev;
      case Constants.environmentProd:
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
