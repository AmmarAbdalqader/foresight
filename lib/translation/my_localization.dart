import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'ar_jo.dart';
import 'en_jo.dart';

@immutable
class MyLocalization extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'ar_JO': Arabic.arabic,
        'en_JO': English.english,
      };
}
