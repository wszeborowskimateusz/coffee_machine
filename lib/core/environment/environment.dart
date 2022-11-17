import 'package:injectable/injectable.dart';
import 'package:vgv_coffee_machine/core/constants/constants.dart';
import 'package:vgv_coffee_machine/core/environment/dart_defines.dart';

enum Environment { dev, prod }

@singleton
class EnvironmentConfig {
  late final Environment currentEnvironment;

  EnvironmentConfig() {
    currentEnvironment = _extractCurrentEnvironmentFromDartDefine();
  }

  Environment _extractCurrentEnvironmentFromDartDefine() {
    switch (DartDefines.environment) {
      case Constants.environmentDev:
        return Environment.dev;
      case Constants.environmentProd:
        return Environment.prod;
      default:
        throw ArgumentError(
          'Following environment: ${DartDefines.environment} is not supported',
        );
    }
  }

  bool get isDev => currentEnvironment == Environment.dev;

  bool get isProd => currentEnvironment == Environment.prod;
}
