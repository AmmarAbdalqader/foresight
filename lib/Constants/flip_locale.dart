import 'dart:ui';
import 'package:get/get.dart';

class FlipLocale {
  static void flipLocale() {
    if (Get.locale == const Locale('ar', 'JO')) {
      Get.updateLocale(const Locale('en', 'JO'));
    } else {
      Get.updateLocale(const Locale('ar', 'JO'));
    }
  }
}
