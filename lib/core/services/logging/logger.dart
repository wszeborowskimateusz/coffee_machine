import 'package:logger/logger.dart';

class Log {
  static final Logger _logger = Logger();

  static void info(String message) {
    _logger.i(message);
  }

  static void error(String message, [dynamic error, StackTrace? stackTrace]) {
    _logger.e(message, error, stackTrace);
  }
}
