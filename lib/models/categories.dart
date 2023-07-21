import 'dart:convert';
import 'package:foresight/constants/app_config.dart';
import 'package:foresight/constants/app_colors.dart';
import 'package:foresight/helpers/api_endpoints.dart';
import 'package:foresight/helpers/http.dart';
import 'package:get/get.dart';

class Categories {
  final int id;
  final String nameAR;
  final String nameEN;
  final String icon;

  Categories(
      {required this.id,
      required this.nameAR,
      required this.nameEN,
      required this.icon});

  factory Categories.fromJson(Map json) => Categories(
        id: json['ID'],
        nameAR: json['NameAR'],
        nameEN: json['NameEN'],
        icon: json['Icon'],
      );

  static Future<List<Categories>> getCategories(int categoryID) async {
    /// categoryID == 0 ? get all Categories
    List<Categories> list = [];
    try {
      var res =
          await HTTP.get("${AppConfig.url}${API.getCategories}/$categoryID");
      if (res.statusCode == 200) {
        list = (json.decode(utf8.decode(res.bodyBytes)) as List)
            .map((e) => Categories.fromJson(e))
            .toList();
      }
    } catch (e) {
      Get.snackbar('AnErrorHasOccurred', 'CheckYourInternet',
          backgroundColor: danger, duration: const Duration(seconds: 5));
    }
    return list;
  }
}
