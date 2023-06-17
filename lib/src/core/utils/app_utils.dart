import 'dart:developer';

class AppUtils {
  static void logger(Object message, {Type? location, bool isError = false}) {
    log(
      message.toString() + (isError ? ' has ERROR' : ''),
      name: isError
          ? (location?.toString() ?? ' ERROR')
          : location?.toString() ?? '',
    );
  }
}
