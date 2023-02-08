import 'package:flutter/foundation.dart';

class TestUtilities {
  void disableOverflowErrors() {
    FlutterError.onError = (FlutterErrorDetails details) {
      final exception = details.exception;
      final isOverflowError = exception is FlutterError &&
          !exception.diagnostics.any((e) =>
              e.value.toString().startsWith("A RenderFlex overflowed by"));

      if (isOverflowError) {
        print("A render flex occured with the widget at");
        int startingIndex = details.toString().indexOf(
            RegExp(r'[a-z]*\s[a-z]*\:file\:\D*\d*\:\d*', caseSensitive: false));
        int endingIndex = details.toString().indexOf("\n", startingIndex);
        print("\t" + details.toString().substring(startingIndex, endingIndex));
      } else {
        FlutterError.presentError(details);
      }
    };
  }
}
