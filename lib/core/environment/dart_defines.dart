import 'package:vgv_coffee_machine/core/constants/constants.dart';

abstract class DartDefines {
  static const String environment = String.fromEnvironment(
    Constants.dartDefineEnvironment,
    defaultValue: Constants.environmentDev,
  );
}
