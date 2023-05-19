import 'package:get/get_navigation/src/root/internacionalization.dart';
import 'ar_jo.dart';
import 'en_jo.dart';

class MyLocalization extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'ar_JO': Arabic.arabic,
        'en_JO': English.english,
      };
}
