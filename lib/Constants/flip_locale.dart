import 'dart:ui';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class FlipLocale {
  static void flipLocale() async {
    final storage = GetStorage();
    if (storage.read("Locale") == 'ar') {
      Get.updateLocale(const Locale('en', 'JO'));
      await storage.write("Locale", 'en');
    } else {
      Get.updateLocale(const Locale('ar', 'JO'));
      await storage.write("Locale", 'ar');
    }
  }

  static bool isLocaleAr() => Get.locale?.languageCode == 'ar';
}
