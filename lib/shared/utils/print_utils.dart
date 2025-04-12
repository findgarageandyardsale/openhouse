import 'package:flutter/foundation.dart';

class PrintUtils {
  static void customLog(String message) {
    if (kDebugMode) print(message);
  }

  static bool radiusInAllChip = false;
}
