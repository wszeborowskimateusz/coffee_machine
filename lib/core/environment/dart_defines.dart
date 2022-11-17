import 'package:injectable/injectable.dart';
import 'package:vgv_coffee_machine/core/constants/constants.dart';

@singleton
class DartDefines {
  final String environment;

  const DartDefines(this.environment);

  @factoryMethod
  factory DartDefines.init() => const DartDefines(
        String.fromEnvironment(
          Constants.dartDefineEnvironment,
          defaultValue: Constants.environmentDev,
        ),
      );
}
