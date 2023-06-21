part of 'util.dart';

class LogUtils {
  late Logger _logger;

  LogUtils() {
    _logger = Logger(
        printer: PrettyPrinter(
      printTime: true,
    ));
  }

  void info(dynamic message) {
    _logger.i(message);
  }

  void debug(dynamic message) {
    _logger.d(message);
  }

  void error(dynamic message) {
    _logger.d(message);
  }

}
