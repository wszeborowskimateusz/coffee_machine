import 'package:injectable/injectable.dart';
import 'package:vgv_coffee_machine/core/environment/environment.dart';

@singleton
class DartDefines {
  /// Dart define key for setting up environment
  static const String _dartDefineEnvironment = 'DART_DEFINE_ENV';

  final String environment;

  const DartDefines(this.environment);

  @factoryMethod
  factory DartDefines.init() => const DartDefines(
        String.fromEnvironment(
          _dartDefineEnvironment,
          defaultValue: EnvironmentConfig.environmentDevString,
        ),
      );
}
