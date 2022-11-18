import 'package:logger/logger.dart';
import 'package:vgv_coffee_machine/core/dependency_injection/get_it.dart';
import 'package:vgv_coffee_machine/core/environment/environment.dart';

class Log {
  static late final Logger _logger;

  static void init() {
    final bool isProd = getIt<EnvironmentConfig>().isProd;

    _logger = Logger(level: isProd ? Level.nothing : Level.info);
  }

  static void info(String message) {
    _logger.i(message);
  }

  static void error(String message, [dynamic error, StackTrace? stackTrace]) {
    _logger.e(message, error, stackTrace);
  }
}
